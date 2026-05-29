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

variable "function_app_name" {
  type = string
}

variable "app_service_name" {
  type = string
}

variable "vm_name" {
  type = string
}

variable "vm_admin_username" {
  type      = string
  sensitive = true
}

variable "vm_admin_password" {
  type      = string
  sensitive = true
}

variable "databricks_workspace_name" {
  type = string
}

variable "databricks_managed_rg_name" {
  type = string
}