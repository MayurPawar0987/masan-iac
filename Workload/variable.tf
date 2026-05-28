variable "environment" {
}
variable "location" {
  type = string
}

variable "project" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "resource_group_name" {
  type = string
}

variable "vnet_address_space" {
  type = list(string)
}

variable "subnets" {
  type = map(object({
    address_prefixes = list(string)
    delegation = optional(object({
      name         = string
      service_name = string
      actions      = list(string)
    }))
  }))
}

variable "storage_account_name" {
  type = string
}

variable "key_vault_name" {
  type = string
}

variable "data_factory_name" {
  type = string
}

variable "databricks_workspace_name" {
  type = string
}

variable "function_app_name" {
  type = string
}

variable "app_service_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "admin_ssh_public_key" {
  type      = string
  sensitive = true
}