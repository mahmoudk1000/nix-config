local M = {}


function M.get_available_schemas()
  local schemas = {}
  local crds_path = vim.fn.stdpath("config") .. "/crds-catalog"
  local catalog_file = crds_path .. "/catalog.txt"

  if vim.fn.filereadable(catalog_file) == 1 then
    local lines = vim.fn.readfile(catalog_file)
    for _, line in ipairs(lines) do
      if line ~= "" then
        local schema_path = crds_path .. "/schemas/" .. line
        if vim.fn.filereadable(schema_path) == 1 then
          schemas["file://" .. schema_path] = "*.{yml,yaml}"
        end
      end
    end
  end

  return schemas
end

function M.k8s_schema_settings()
  local schemas = {
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/pod-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/service-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/deployment-apps-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/statefulset-apps-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/daemonset-apps-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/configmap-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/secret-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/ingress-networking-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/job-batch-v1.json"] = "*.{yml,yaml}",
    ["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.29.0-standalone-strict/cronjob-batch-v1.json"] = "*.{yml,yaml}",
  }

  local crd_schemas = M.get_available_schemas()
  for schema_url, pattern in pairs(crd_schemas) do
    schemas[schema_url] = pattern
  end

  if vim.tbl_isempty(crd_schemas) then
    schemas["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/certificate_v1.json"] = "*.{yml,yaml}"
    schemas["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/issuer_v1.json"] = "*.{yml,yaml}"
    schemas["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/cert-manager.io/clusterissuer_v1.json"] = "*.{yml,yaml}"
    schemas["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json"] = "*.{yml,yaml}"
    schemas["https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/appproject_v1alpha1.json"] = "*.{yml,yaml}"
  end

  return {
    yaml = {
      schemas = schemas,
      validate = true,
      hover = true,
      completion = true,
      schemaStore = {
        enable = true,
        url = ""
      },
    }
  }
end

function M.default_schema_settings()
  local schemas = {
    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
    ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
    ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
    ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
    ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
    ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
    ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
    ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
    ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
  }

  return {
    yaml = {
      schemas = schemas,
      validate = true,
      hover = true,
      completion = true,
      schemaStore = {
        enable = true,
        url = ""
      },
      customTags = {
        "!Ref", "!Condition", "!GetAtt", "!Join", "!Select", "!Split",
        "!Sub", "!Base64", "!GetAZs", "!ImportValue", "!FindInMap",
        "!Equals", "!If", "!And", "!Or", "!Not"
      }
    }
  }
end

function M.settings_for(ft)
  if ft == "yaml.kubernetes" then
    return M.k8s_schema_settings()
  else
    return M.default_schema_settings()
  end
end

return M
