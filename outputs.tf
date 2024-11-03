output "name" {
  value = azurerm_virtual_machine.vm.name
}

output "ip" {
  value = azurerm_virtual_machine.vm.primary_network_interface_id
}