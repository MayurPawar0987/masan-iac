variable "name" {
  type        = string
  description = "Name of the App Service"
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
  description = "OS type (Linux or Windows)"
}

variable "sku_name" {
  type        = string
  default     = "P1v3"
  description = "SKU name for the App Service Plan"
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
  description = "App settings / environment variables"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
