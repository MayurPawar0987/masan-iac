subscription_id = ""  
client_id       = ""   
client_secret   = ""   
tenant_id       = "" 

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
}

storage_account_name      = "stmasandev001"
key_vault_name            = "kv-masan-dev-001"
data_factory_name         = "adf-masan-dev"
databricks_workspace_name = "dbw-masan-dev"
function_app_name         = "func-masan-dev"
app_service_name          = "app-masan-dev"
vm_name                   = "vm-masan-dev-001"