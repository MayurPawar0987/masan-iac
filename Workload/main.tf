module "resource_group" {
  source = "../Modules/ResourceGroup"

  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

module "virtual_network" {
  source = "../Modules/VirtualNetwork"

  name                = "vnet-${var.project}-${var.environment}"
  location            = var.location
  resource_group_name = module.resource_group.name
  address_space       = var.vnet_address_space
  subnets             = var.subnets
  tags                = var.tags
}

module "storage_account" {
  source = "../Modules/StorageAccount"

  name                        = var.storage_account_name
  location                    = var.location
  resource_group_name         = module.resource_group.name
  account_tier                = "Standard"
  account_replication_type    = "LRS"
  network_default_action      = "Allow"
  allowed_subnet_ids          = []
  tags                        = var.tags

  containers = {
    tfstate = {
      access_type = "private"
    }
  }
}

module "key_vault" {
  source = "../Modules/KeyVault"

  name                    = var.key_vault_name
  location                = var.location
  resource_group_name     = module.resource_group.name
  network_default_action  = "Allow"
  allowed_subnet_ids      = []
  tags                    = var.tags
}

module "data_factory" {
  source = "../Modules/DataFactory"

  name                = var.data_factory_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tags                = var.tags
}

module "app_service" {
  source = "../Modules/AppService"

  name                = var.app_service_name
  location            = var.location
  resource_group_name = module.resource_group.name
  os_type             = "Linux"
  sku_name            = "P1v3"

  app_settings = {
    WEBSITE_RUN_FROM_PACKAGE = "1"
  }

  tags = var.tags
}

module "function_app" {
  source = "../Modules/Functions"

  name                       = var.function_app_name
  location                   = var.location
  resource_group_name        = module.resource_group.name
  storage_account_name       = module.storage_account.name
  storage_account_access_key = module.storage_account.primary_access_key

  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
  }

  tags = var.tags
}

module "virtual_machine" {
  source = "../Modules/VirtualMachine"

  name                = var.vm_name
  location            = var.location
  resource_group_name = module.resource_group.name
  subnet_id           = module.virtual_network.subnet_ids["snet-app"]
  admin_username      = var.vm_admin_username
  admin_password      = var.vm_admin_password

  tags = var.tags
}