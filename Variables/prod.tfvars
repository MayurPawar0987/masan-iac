environment = "prod"
location    = "eastus"
project     = "masan"

tags = {
  Environment = "prod"
  Project     = "masan"
  ManagedBy   = "terraform"
}

resource_group_name = "rg-masan-prod"

vnet_address_space = ["10.20.0.0/16"]
subnets = {
  "snet-app"               = { address_prefixes = ["10.20.1.0/24"], delegation = null }
  "snet-data"              = { address_prefixes = ["10.20.2.0/24"], delegation = null }
  "snet-integration"       = { address_prefixes = ["10.20.3.0/24"], delegation = null }
  "AzureFirewallSubnet"    = { address_prefixes = ["10.20.4.0/26"], delegation = null }
  "snet-private-endpoints" = { address_prefixes = ["10.20.5.0/24"], delegation = null }
  "snet-databricks-public" = {
    address_prefixes = ["10.20.6.0/24"]
    delegation = {
      name         = "databricks-delegation"
      service_name = "Microsoft.Databricks/workspaces"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
  "snet-databricks-private" = {
    address_prefixes = ["10.20.7.0/24"]
    delegation = {
      name         = "databricks-delegation"
      service_name = "Microsoft.Databricks/workspaces"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
}

storage_account_name       = "stmasanprod001"
key_vault_name             = "kv-masan-prod-001"
data_factory_name          = "adf-masan-prod"
function_app_name          = "func-masan-prod"
app_service_name           = "app-masan-prod"
vm_name                    = "vm-masan-prod-001"
databricks_workspace_name  = "dbw-masan-prod"
databricks_managed_rg_name = "rg-masan-prod-databricks-managed"
