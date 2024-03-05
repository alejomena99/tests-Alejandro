output "resources_location" {
  value = var.location
}

output "virtual_machine_ip" {
  value = resource.azurerm_linux_virtual_machine.virtual_machine.public_ip_address
}

