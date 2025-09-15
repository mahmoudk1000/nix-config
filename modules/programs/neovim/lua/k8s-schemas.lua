local M = {}

-- Configuration
local CONFIG = {
	crds_catalog_path = vim.fn.expand("~/.config/nvim/crds-catalog"),
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
		"kustomization",
		"helm",
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

-- Cache
local cache = {
	catalog = nil,
	buffer_resources = {},
}

-- Safe utility functions with error handling
local function safe_call(func, ...)
	local ok, result = pcall(func, ...)
	if not ok then
		return nil
	end
	return result
end

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
	if not api_version then
		return false
	end

	for _, core_api in ipairs(CONFIG.core_k8s_apis) do
		if api_version == core_api then
			return true
		end
	end
	return false
end

-- Load CRD catalog from local file with error handling
local function load_crd_catalog()
	if cache.catalog then
		return cache.catalog
	end

	cache.catalog = {}

	local catalog_file_path = get_catalog_file()
	if vim.fn.filereadable(catalog_file_path) ~= 1 then
		return cache.catalog
	end

	local catalog_file = io.open(catalog_file_path, "r")
	if not catalog_file then
		return cache.catalog
	end

	local ok, content = pcall(catalog_file.read, catalog_file, "*all")
	catalog_file:close()

	if not ok or not content then
		return cache.catalog
	end

	for line in content:gmatch("[^\r\n]+") do
		if line ~= "" and line:match("%.json$") then
			table.insert(cache.catalog, line)
		end
	end

	return cache.catalog
end

-- Extract Kubernetes resources from YAML content
local function extract_k8s_resources(content)
	if not content or content == "" then
		return {}
	end

	local resources = {}
	local ok, documents = pcall(vim.split, content, "\n---", { plain = true })
	if not ok then
		return resources
	end

	-- If no document separators, treat entire content as one document
	if #documents == 1 and not content:match("\n%-%-%-") then
		documents = { content }
	end

	for _, doc in ipairs(documents) do
		if doc and doc:match("%S") then -- Only process non-empty documents
			local api_version = doc:match("apiVersion:%s*([%w%.%/%-]+)")
			local kind = doc:match("kind:%s*([%w%-]+)")

			if api_version and kind then
				table.insert(resources, {
					apiVersion = api_version,
					kind = kind,
				})
			end
		end
	end

	return resources
end

-- Normalize CRD name for schema matching
local function normalize_crd_name(api_version, kind)
	if not api_version or not kind then
		return nil
	end

	local group, version = api_version:match("([^/]+)/([^/]+)")
	if not group or not version then
		return nil
	end

	return group .. "/" .. kind:lower() .. "_" .. version .. ".json"
end

-- Find matching CRD schemas
local function find_crd_schemas(resources)
	local schemas = {}
	local catalog = load_crd_catalog()

	for _, resource in ipairs(resources or {}) do
		if resource and resource.apiVersion and not is_core_k8s_resource(resource.apiVersion) then
			local crd_name = normalize_crd_name(resource.apiVersion, resource.kind)
			if crd_name then
				for _, crd_path in ipairs(catalog) do
					if crd_path and crd_path:match(vim.pesc(crd_name)) then
						local schema_path = get_schemas_dir() .. "/" .. crd_path
						if vim.fn.filereadable(schema_path) == 1 then
							schemas["file://" .. schema_path] = true
							break
						end
					end
				end
			end
		end
	end

	return schemas
end

-- Get cached buffer resources
local function get_buffer_resources(bufnr)
	if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
		return {}
	end

	local ok, changedtick = pcall(vim.fn.getbufvar, bufnr, "changedtick")
	if not ok then
		return {}
	end

	local cache_key = bufnr .. "_" .. changedtick

	if cache.buffer_resources[cache_key] then
		return cache.buffer_resources[cache_key]
	end

	local ok2, lines = pcall(vim.api.nvim_buf_get_lines, bufnr, 0, -1, false)
	if not ok2 or not lines then
		return {}
	end

	local content = table.concat(lines, "\n")
	local resources = extract_k8s_resources(content)

	cache.buffer_resources[cache_key] = resources

	-- Clean old cache entries
	if vim.tbl_count(cache.buffer_resources) > 10 then
		local keys = vim.tbl_keys(cache.buffer_resources)
		for i = 1, math.min(5, #keys) do
			cache.buffer_resources[keys[i]] = nil
		end
	end

	return resources
end

-- Public API with comprehensive error handling
function M.isKubernetesResource(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
		return false
	end

	-- Check filename first (fastest)
	local ok, buffer_name = pcall(vim.api.nvim_buf_get_name, bufnr)
	if ok and buffer_name and is_k8s_filename(buffer_name) then
		return true
	end

	-- Check content
	local resources = get_buffer_resources(bufnr)
	return #resources > 0
end

function M.buildScheme(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
		return {}
	end

	local ok, buffer_name = pcall(vim.api.nvim_buf_get_name, bufnr)
	if not ok then
		return {}
	end

	local file_pattern = buffer_name and buffer_name ~= "" and buffer_name or "*.{yaml,yml}"

	if not M.isKubernetesResource(bufnr) then
		return {}
	end

	local schemas = {}
	local resources = get_buffer_resources(bufnr)
	local has_core_k8s = false

	-- Check if we have core Kubernetes resources
	for _, resource in ipairs(resources) do
		if resource and is_core_k8s_resource(resource.apiVersion) then
			has_core_k8s = true
			break
		end
	end

	-- Add core Kubernetes schema only for core resources
	if has_core_k8s or (buffer_name and is_k8s_filename(buffer_name)) then
		schemas[CONFIG.k8s_core_schema] = file_pattern
	end

	-- Add CRD schemas for custom resources
	local crd_schemas = find_crd_schemas(resources)
	for schema_url, _ in pairs(crd_schemas) do
		schemas[schema_url] = file_pattern
	end

	return schemas
end

function M.clearCache()
	cache.catalog = nil
	cache.buffer_resources = {}
end

return M
