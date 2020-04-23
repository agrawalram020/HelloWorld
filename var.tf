variable "resource_group_name" {
  description = "name of resource group"
}

variable "location" {
  description = "name of resource group location"
}

variable "vm_name" {
  default = "test-vm"
}

variable "image" {
  default = "UbuntuServer"
}

variable "username" {
  default = "testadmin"
}

variable "password" {
  default = "test"
}

variable "size" {
    default = "Standard_B1ls"
}

variable "sku" {
  default = "16.04-LTS"
}

variable "publisher" {
  default = "Canonical"
}









