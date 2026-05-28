variable "name" {
  type        = string
  description = "Name of the Network Security Group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default     = []
  description = "List of security rules to apply"
}

variable "subnet_ids" {
  type        = list(string)
  default     = []
  description = "Subnet IDs to associate this NSG with"
}

variable "tags" {
  type        = map(string)
  default     = {}
}
