data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  address_space       = var.virtual_network_address_space
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_address_prefixes
}

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.nic_name
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.virtual_machine_name
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.virtual_machine_size

  storage_os_disk {
    name              = var.vm_os_disk_name              # "vm-os-disk"
    caching           = var.vm_os_disk_caching           # "ReadWrite"
    create_option     = var.vm_os_disk_create_option     # "FromImage"
    managed_disk_type = var.vm_os_disk_managed_disk_type #"Standard_LRS"
  }

  storage_image_reference {
    publisher = var.vm_storage_image_publisher # "Canonical"
    offer     = var.vm_storage_image_offer     # "UbuntuServer"
    sku       = var.vm_storage_image_sku       # "24.04-LTS"
    version   = var.vm_storage_image_version   # "latest"
  }

  os_profile {
    computer_name  = var.vm_computer_name  # "lab-vm"
    admin_username = var.vm_admin_username # "adminuser"
    admin_password = var.vm_admin_password # "Password1234!"

  }

  os_profile_linux_config {
    disable_password_authentication = var.vm_config_disable_password_authentication
  }
}