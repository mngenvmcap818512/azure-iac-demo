variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-ne1-prd-landingzone-networks"
}

variable "location" {
  description = "Azure region where the resource group will be created"
  type        = string
  default     = "North Europe"
}

variable "tags" {
  description = "Tags to apply to the resource group"
  type        = map(string)
  default = {
    environment = "CICDdemo"
    owner       = "floureiro@microsoft.com"
    landingzone = "demolandzone"
    project     = "iacdemo"
  }
}

variable "vnet_name" {
	description = "Name of the virtual network"
	type        = string
	default     = "ne1-spoke-vnet1"
}

variable "address_spaces" {
	description = "List of address spaces for the VNet"
	type        = list(string)
	default     = ["10.1.0.0/16"]
}

