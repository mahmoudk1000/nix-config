local M = {}

-- Enhanced function to check if content has Kubernetes resources
local function is_kubernetes_yaml(bufnr)
  if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
    return false
  end
  
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local content = table.concat(lines, "\n"):lower()
  
  -- Check for Kubernetes indicators - simple and dynamic
  local has_apiversion = content:match("apiversion%s*:")
  local has_kind = content:match("kind%s*:")
  
  -- If both apiVersion and kind are present, it's likely Kubernetes
  return has_apiversion and has_kind
end

-- Get comprehensive schemas that include both K8s and common YAML types
local function get_comprehensive_schemas()
  return {
    -- Kubernetes schemas (most specific patterns first)
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.32.3/all.json"] = "*.{yaml,yml}",
    
    -- Specific file patterns
    ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yaml,yml}",
    ["https://json.schemastore.org/github-action.json"] = ".github/action.{yaml,yml}",
    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yaml,yml}",
    ["https://json.schemastore.org/ansible-playbook.json"] = "*play*.{yaml,yml}",
    ["https://json.schemastore.org/chart.json"] = "Chart.{yaml,yml}",
    ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yaml,yml}",
    ["https://json.schemastore.org/dependabot-v2.json"] = ".github/dependabot.{yaml,yml}",
    ["https://json.schemastore.org/gitlab-ci.json"] = "*gitlab-ci*.{yaml,yml}",
    ["https://json.schemastore.org/prettierrc.json"] = ".prettierrc.{yaml,yml}",
    ["https://json.schemastore.org/ansible-stable-2.9.json"] = "roles/tasks/*.{yaml,yml}",
  }
end

-- Get Kubernetes-specific settings with enhanced completion
local function get_k8s_settings()
  return {
    yaml = {
      validate = true,
      hover = true,
      completion = true,
      schemaStore = {
        enable = false,
        url = ""
      },
      -- Remove customTags for Kubernetes - they interfere with K8s completion
      customTags = {},
      schemas = {
        ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.32.3/all.json"] = "*.{yaml,yml}"
      },
      -- Enhanced completion settings for Kubernetes
      suggest = {
        parentSkeletonSelectedFirst = true,
      },
      format = {
        enable = true,
        singleQuote = false,
        bracketSpacing = true,
        proseWrap = "preserve",
        printWidth = 120
      }
    }
  }
end

-- Get comprehensive settings for non-K8s YAML files
local function get_comprehensive_settings()
  return {
    yaml = {
      validate = true,
      hover = true,
      completion = true,
      schemaStore = {
        enable = false,
        url = ""
      },
      customTags = {
        "!Ref", "!Condition", "!GetAtt", "!Join", "!Select", "!Split",
        "!Sub", "!Base64", "!GetAZs", "!ImportValue", "!FindInMap",
        "!Equals", "!If", "!And", "!Or", "!Not"
      },
      schemas = get_comprehensive_schemas(),
      suggest = {
        parentSkeletonSelectedFirst = true,
      },
      format = {
        enable = true,
        singleQuote = false,
        bracketSpacing = true,
        proseWrap = "preserve",
        printWidth = 120
      }
    }
  }
end

-- Main function to get settings for yamlls
function M.get_settings()
  return get_comprehensive_settings()
end

-- Update yamlls configuration when entering insert mode on K8s files
local function update_schemas_for_k8s()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  
  if not filename:match("%.ya?ml$") then
    return
  end
  
  local is_k8s = is_kubernetes_yaml(bufnr)
  if not is_k8s then
    return
  end
  
  -- Send workspace configuration update with K8s-specific settings
  local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "yamlls" })
  for _, client in ipairs(clients) do
    local new_settings = get_k8s_settings()
    
    client.config.settings = new_settings
    client.notify("workspace/didChangeConfiguration", {
      settings = new_settings
    })
  end
end

-- Setup automatic schema detection
function M.setup_autoregistration()
  local group = vim.api.nvim_create_augroup("YamlSchemaAutoRegistration", { clear = true })
  
  -- Update schemas when entering insert mode
  vim.api.nvim_create_autocmd("InsertEnter", {
    group = group,
    pattern = "*.{yml,yaml}",
    callback = update_schemas_for_k8s,
  })
  
  -- Also update on escape (when leaving insert mode) to prepare for next time
  vim.api.nvim_create_autocmd("InsertLeave", {
    group = group,
    pattern = "*.{yml,yaml}",
    callback = function()
      local bufnr = vim.api.nvim_get_current_buf()
      local filename = vim.api.nvim_buf_get_name(bufnr)
      
      if not filename:match("%.ya?ml$") then
        return
      end
      
      -- Reset to comprehensive schemas
      local clients = vim.lsp.get_clients({ bufnr = bufnr, name = "yamlls" })
      for _, client in ipairs(clients) do
        local settings = get_comprehensive_settings()
        client.config.settings = settings
        client.notify("workspace/didChangeConfiguration", {
          settings = settings
        })
      end
    end,
  })
end

-- Manual function to force schema detection
function M.force_schema_update()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  
  local is_k8s = is_kubernetes_yaml(bufnr)
  vim.notify(string.format("File: %s, Detected as: %s", 
    vim.fn.fnamemodify(filename, ":t"), 
    is_k8s and "Kubernetes YAML" or "Regular YAML"), 
    vim.log.levels.INFO)
  
  if is_k8s then
    update_schemas_for_k8s()
    vim.notify("Schema update completed!", vim.log.levels.INFO)
  else
    vim.notify("Regular YAML - using default schemas", vim.log.levels.INFO)
  end
end

return M