environment = "dev"
location    = "eastus"
project     = "masan"

tags = {
  Environment = "dev"
  Project     = "masan"
  ManagedBy   = "terraform"
}

resource_group_name = "rg-masan-dev"

vnet_address_space = ["10.10.0.0/16"]
subnets = {
  "snet-app"               = { address_prefixes = ["10.10.1.0/24"], delegation = null }
  "snet-data"              = { address_prefixes = ["10.10.2.0/24"], delegation = null }
  "snet-integration"       = { address_prefixes = ["10.10.3.0/24"], delegation = null }
  "AzureFirewallSubnet"    = { address_prefixes = ["10.10.4.0/26"], delegation = null }
  "snet-private-endpoints" = { address_prefixes = ["10.10.5.0/24"], delegation = null }
  "snet-databricks-public" = {
    address_prefixes = ["10.10.6.0/24"]
    delegation = {
      name         = "databricks-delegation"
      service_name = "Microsoft.Databricks/workspaces"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
  "snet-databricks-private" = {
    address_prefixes = ["10.10.7.0/24"]
    delegation = {
      name         = "databricks-delegation"
      service_name = "Microsoft.Databricks/workspaces"
      actions      = ["Microsoft.Network/virtualNetworks/subnets/join/action", "Microsoft.Network/virtualNetworks/subnets/prepareNetworkPolicies/action", "Microsoft.Network/virtualNetworks/subnets/unprepareNetworkPolicies/action"]
    }
  }
}

storage_account_name       = "stmasandev001"
key_vault_name             = "kv-masan-dev-001"
data_factory_name          = "adf-masan-dev"
function_app_name          = "func-masan-dev"
app_service_name           = "app-masan-dev"
vm_name                    = "vm-masan-dev-001"
databricks_workspace_name  = "dbw-masan-dev"
databricks_managed_rg_name = "rg-masan-dev-databricks-managed"
