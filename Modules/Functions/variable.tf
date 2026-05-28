variable "name" {
  type        = string
  description = "Name of the Function App"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "os_type" {
  type        = string
  default     = "Linux"
  description = "OS type for the App Service Plan (Linux or Windows)"
}

variable "sku_name" {
  type        = string
  default     = "Y1"
  description = "SKU name for the App Service Plan"
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name for the Function App"
}

variable "storage_account_access_key" {
  type        = string
  sensitive   = true
  description = "Storage account access key"
}

variable "python_version" {
  type        = string
  default     = "3.11"
  description = "Python version (Linux only)"
}

variable "dotnet_version" {
  type        = string
  default     = "v6.0"
  description = ".NET version (Windows only)"
}

variable "app_settings" {
  type        = map(string)
  default     = {}
  description = "Application settings for the Function App"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
