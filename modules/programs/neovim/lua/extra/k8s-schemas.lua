local M = {}

local CONFIG = {
	crds_catalog_path = vim.fn.stdpath("config") .. "/crds-catalog",
	k8s_core_schema = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.32.3/all.json",
	k8s_filename_patterns = {
		"deployment",
		"deploy",
		"svc",
		"service",
		"pod",
		"ingress",
		"configmap",
		"secret",
		"namespace",
		"pv",
		"pvc",
		"statefulset",
		"daemonset",
		"job",
		"cronjob",
		"hpa",
		"vpa",
		"networkpolicy",
		"rbac",
		"role",
		"rolebinding",
		"clusterrole",
		"clusterrolebinding",
		"serviceaccount",
		"persistentvolume",
		"persistentvolumeclaim",
		"storageclass",
		"volumesnapshot",
		"gateway",
		"httproute",
		"replicaset",
		"endpoints",
		"endpointslice",
		"priorityclass",
		"poddisruptionbudget",
		"horizontalpodautoscaler",
		"verticalpodautoscaler",
		"limitrange",
		"resourcequota",
		"lease",
		"crd",
		"customresourcedefinition",
		"webhook",
		"mutatingwebhook",
		"validatingwebhook",
		"csi",
		"node",
		"cluster",
		"machine",
		"machinedeployment",
		"machineset",
		"kubeconfig",
		"etcd",
		"chart",
		"k8s",
	},
	core_k8s_apis = {
		"v1",
		"apps/v1",
		"batch/v1",
		"batch/v1beta1",
		"extensions/v1beta1",
		"networking.k8s.io/v1",
		"policy/v1",
		"policy/v1beta1",
		"rbac.authorization.k8s.io/v1",
		"storage.k8s.io/v1",
		"admissionregistration.k8s.io/v1",
		"apiextensions.k8s.io/v1",
		"scheduling.k8s.io/v1",
		"coordination.k8s.io/v1",
		"autoscaling/v1",
		"autoscaling/v2",
	},
}

local cache = { catalog = nil, buffer_resources = {} }

local function get_catalog_file()
	return CONFIG.crds_catalog_path .. "/catalog.txt"
end

local function get_schemas_dir()
	return CONFIG.crds_catalog_path .. "/schemas"
end

local function is_k8s_filename(filepath)
	if not filepath or filepath == "" then
		return false
	end
	local ok, filename = pcall(vim.fn.fnamemodify, filepath, ":t:r")
	if not ok or not filename then
		return false
	end
	filename = filename:lower()
	for _, pattern in ipairs(CONFIG.k8s_filename_patterns) do
		if filename:find(pattern, 1, true) then
			return true
		end
	end
	return false
end

local function is_core_k8s_resource(api_version)
	for _, core_api in ipairs(CONFIG.core_k8s_apis) do
		if api_version == core_api then
			return true
		end
	end
	return false
end

local function load_crd_catalog()
	if cache.catalog then
		return cache.catalog
	end
	cache.catalog = {}
	local path = get_catalog_file()
	if vim.fn.filereadable(path) ~= 1 then
		return cache.catalog
	end
	local file = io.open(path, "r")
	if not file then
		return cache.catalog
	end
	local content = file:read("*all")
	file:close()
	if not content then
		return cache.catalog
	end
	for line in content:gmatch("[^\r\n]+") do
		if line:match("%.json$") then
			table.insert(cache.catalog, line)
		end
	end
	return cache.catalog
end

local function extract_k8s_resources(content)
	if not content or content == "" then
		return {}
	end
	local resources = {}
	local ok, documents = pcall(vim.split, content, "\n---", { plain = true })
	if not ok then
		return resources
	end
	if #documents == 1 and not content:match("\n%-%-%-") then
		documents = { content }
	end
	for _, doc in ipairs(documents) do
		local api_version = doc:match("apiVersion:%s*([%w%.%/%-]+)")
		local kind = doc:match("kind:%s*([%w%-]+)")
		if api_version and kind then
			table.insert(resources, { apiVersion = api_version, kind = kind })
		end
	end
	return resources
end

local function normalize_crd_name(api_version, kind)
	local group, version = api_version:match("([^/]+)/([^/]+)")
	if not group or not version or not kind then
		return nil
	end
	return group .. "/" .. kind:lower() .. "_" .. version .. ".json"
end

local function fuzzy_find_crd_name(crd_name, catalog)
	crd_name = crd_name:lower()
	for _, v in ipairs(catalog) do
		if v:lower():find(crd_name, 1, true) then
			return v
		end
	end
	return nil
end

local function find_crd_schemas(resources)
	local schemas, catalog = {}, load_crd_catalog()
	for _, r in ipairs(resources or {}) do
		if r.apiVersion and not is_core_k8s_resource(r.apiVersion) then
			local crd_name = normalize_crd_name(r.apiVersion, r.kind)
			if crd_name then
				local crd_path = fuzzy_find_crd_name(crd_name, catalog)
				if crd_path then
					local schema_path = get_schemas_dir() .. "/" .. crd_path
					if vim.fn.filereadable(schema_path) == 1 then
						schemas["file://" .. schema_path] = true
					end
				end
			end
		end
	end
	return schemas
end

local function get_buffer_resources(bufnr)
	if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
		return {}
	end
	local changedtick = vim.fn.getbufvar(bufnr, "changedtick")
	local cache_key = bufnr .. "_" .. changedtick
	if cache.buffer_resources[cache_key] then
		return cache.buffer_resources[cache_key]
	end
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	if not lines then
		return {}
	end
	local content = table.concat(lines, "\n")
	local resources = extract_k8s_resources(content)
	cache.buffer_resources[cache_key] = resources
	if vim.tbl_count(cache.buffer_resources) > 10 then
		for i, k in ipairs(vim.tbl_keys(cache.buffer_resources)) do
			if i <= 5 then
				cache.buffer_resources[k] = nil
			end
		end
	end
	return resources
end

function M.isKubernetesResource(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if not vim.api.nvim_buf_is_valid(bufnr) then
		return false
	end
	local buffer_name = vim.api.nvim_buf_get_name(bufnr)
	if is_k8s_filename(buffer_name) then
		return true
	end
	return #get_buffer_resources(bufnr) > 0
end

function M.buildScheme(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()
	if not vim.api.nvim_buf_is_valid(bufnr) then
		return {}
	end
	local buffer_name = vim.api.nvim_buf_get_name(bufnr)
	local file_pattern = buffer_name ~= "" and buffer_name or "*.{yaml,yml}"
	if not M.isKubernetesResource(bufnr) then
		return {}
	end
	local schemas, resources = {}, get_buffer_resources(bufnr)
	local has_core_k8s = false
	for _, r in ipairs(resources) do
		if is_core_k8s_resource(r.apiVersion) then
			has_core_k8s = true
			break
		end
	end
	if has_core_k8s then
		schemas[CONFIG.k8s_core_schema] = file_pattern
	end
	for schema_url in pairs(find_crd_schemas(resources)) do
		schemas[schema_url] = file_pattern
	end
	return schemas
end

return M
