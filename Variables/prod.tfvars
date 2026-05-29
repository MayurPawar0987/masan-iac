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
}

storage_account_name      = "stmasanprod001"
key_vault_name            = "kv-masan-prod-001"
data_factory_name         = "adf-masan-prod"
function_app_name         = "func-masan-prod"
app_service_name          = "app-masan-prod"
vm_name                   = "vm-masan-prod-001"