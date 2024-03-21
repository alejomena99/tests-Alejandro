
resource "azurerm_virtual_network" "vm_virtual_network" {
  name                = "${var.prefix}-network"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = "${var.prefix}-internal"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vm_virtual_network.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "public_ip" {
  name                = "${var.prefix}-public-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Dynamic"
}

resource "azurerm_network_interface" "vm_network_interface" {
  name                = "${var.prefix}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

resource "azurerm_linux_virtual_machine" "virtual_machine" {
  name                = "${var.prefix}-machine"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = "adminuser"
  network_interface_ids = [
    azurerm_network_interface.vm_network_interface.id,
  ]

  admin_ssh_key {
        username   = "adminuser"
        public_key = sensitive(file("${var.ssh_file_path}"))
  }

  os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
  }

  source_image_reference {
        publisher = "Canonical"
        offer     = "UbuntuServer"
        sku       = "18.04-LTS"
        version   = "latest"
  }
}

        # publisher = "RedHat"
        # offer     = "RHEL"
        # sku       = "7.8"
        # version   = "latest"