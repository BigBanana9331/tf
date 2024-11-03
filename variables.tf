variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
  type        = string
}

variable "virtual_network_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "virtual_network_address_space" {
  description = "The address space of the virtual network."
  type        = list(string)
}

variable "subnet_name" {
  description = "The name of the subnet."
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefixes of the subnet."
  type        = list(string)
}

variable "nic_name" {
  description = "The name of the network interface."
  type        = string
}

variable "virtual_machine_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "private_ip_address_allocation" {
  description = "The allocation method of the private IP address."
  type        = string
  default     = "Dynamic"
}

variable "virtual_machine_size" {
  description = "The size of the virtual machine."
  type        = string
  default     = "Standard_DS1_v2"
}

variable "vm_os_disk_name" {
  description = "The name of the OS disk."
  type        = string
  default     = "vm-os-disk"

}

variable "vm_os_disk_caching" {
  description = "The caching type of the OS disk."
  type        = string
  default     = "ReadWrite"
}

variable "vm_os_disk_create_option" {
  description = "The create option of the OS disk."
  type        = string
  default     = "FromImage"
}

variable "vm_os_disk_managed_disk_type" {
  description = "The managed disk type of the OS disk."
  type        = string
  default     = "Standard_LRS"
}

variable "vm_storage_image_publisher" {
  description = "The publisher of the storage image."
  type        = string
  default     = "Canonical"
}

variable "vm_storage_image_offer" {
  description = "The offer of the storage image."
  type        = string
  default     = "UbuntuServer"
}

variable "vm_storage_image_sku" {
  description = "The SKU of the storage image."
  type        = string
  default     = "24.04-LTS"
}

variable "vm_storage_image_version" {
  description = "The version of the storage image."
  type        = string
  default     = "latest"
}

variable "vm_config_disable_password_authentication" {
  description = "Disable password authentication for the virtual machine."
  type        = bool
  default     = false
}

variable "vm_computer_name" {
  description = "The computer name of the virtual machine."
  type        = string
  default     = "lab-vm"
}

variable "vm_admin_username" {
  description = "The admin username of the virtual machine."
  type        = string
  default     = "adminuser"
}

variable "vm_admin_password" {
  description = "The admin password of the virtual machine."
  type        = string
  default     = "Password1234!"
}