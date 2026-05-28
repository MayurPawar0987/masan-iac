variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "virtual_network_id" {
  type        = string
  description = "VNet ID to link private DNS zones to"
}

variable "private_dns_zones" {
  type        = map(any)
  default     = {}
  description = "Set of private DNS zone names to create"
}

variable "public_dns_zones" {
  type        = map(any)
  default     = {}
  description = "Set of public DNS zone names to create"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
