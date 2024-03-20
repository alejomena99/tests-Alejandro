output "virtual_machine_ip" {
  value = resource.azurerm_linux_virtual_machine.virtual_machine.public_ip_address
}

output "virtual_machine_image" {
  value = resource.azurerm_linux_virtual_machine.virtual_machine.source_image_reference
}
