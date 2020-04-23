provider "azurerm"{

    features {}
    client_id = "d71bb2f2-9dbe-49c9-b093-4012c72fa27b"
    client_secret = "Pf/.R0WptfgdN84ug1r[kajtHE-HeISp"
    tenant_id = "33d703b6-8728-4dd4-b7ee-0abb0da11bc9"
    subscription_id = "5154415b-ef7d-460a-ac96-7c46bf5ba818"
}

# resource "azurerm_resource_group" "test-group" {
#   name     = var.resource_group_name
#   location = var.location
# }

# resource "azurerm_role_assignment" "example" {
#   scope                = "5154415b-ef7d-460a-ac96-7c46bf5ba818"
#   role_definition_name = "Reader"
#   principal_id         = "dd80f00d-a563-477b-9944-8827c10af145"
# }


# resource "azurerm_virtual_network" "main" {
#   name                = "${var.resource_group_name}-network"
#   address_space       = ["10.0.0.0/16"]
#   location            = var.location
#   resource_group_name = var.resource_group_name
# }

# resource "azurerm_subnet" "internal" {
#   name                 = "internal"
#   resource_group_name  =  var.resource_group_name
#   virtual_network_name = azurerm_virtual_network.main.name
#   address_prefix       = "10.0.2.0/24"
# }

# resource "azurerm_network_interface" "main" {
#   name                = "test-nic"
#   location            = var.location
#   resource_group_name = var.resource_group_name

#   ip_configuration {
#     name                          = "testconfiguration1"
#     subnet_id                     = azurerm_subnet.internal.id
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_virtual_machine" "main" {
#   name                  = var.vm_name
#   location              = var.location
#   resource_group_name   = var.resource_group_name
#   network_interface_ids = [azurerm_network_interface.main.id]
#  # vm_size               = "Standard_DS1_v2" Standard_B1ls
#   vm_size               = var.size

#   # Uncomment this line to delete the OS disk automatically when deleting the VM
#   delete_os_disk_on_termination = true

#   # Uncomment this line to delete the data disks automatically when deleting the VM
#   delete_data_disks_on_termination = true

#   storage_image_reference {
#     publisher = var.publisher
#     offer     = var.image
#     sku       = var.sku
#     version   = "latest"
#   }
#   storage_os_disk {
#     name              = "myosdisk1"
#     caching           = "ReadWrite"
#     create_option     = "FromImage"
#     managed_disk_type = "Standard_LRS"
#   }
#   os_profile {
#     computer_name  = "Test"
#     admin_username = var.username
#     admin_password = var.password
#   }
#   os_profile_linux_config {
#     disable_password_authentication = false
#   }
#   tags = {
#     environment = "staging"
#   }
# }



resource "azurerm_virtual_network" "main" {
  name                = "testgp-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefix       = "10.0.2.0/24"
}

resource "azurerm_network_interface" "main" {
  name                = "test-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.internal.id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "main" {
  name                  = var.vm_name
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.main.id]
 # vm_size               = "Standard_DS1_v2" Standard_B1ls
  vm_size               = var.size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.publisher
    offer     = var.image
    sku       = var.sku
    version   = "latest"
  }

    storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "Test"
    admin_username = var.username
    admin_password = "Password123!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    environment = "staging"
  }
}

resource "azuread_group" "example" {
  name    = var.resource_group_name
  members = [ "dd80f00d-a563-477b-9944-8827c10af145"]
}