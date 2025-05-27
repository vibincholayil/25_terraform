resource "aws_instance" "ec2" {
  ami                     = "ami-03250b0e01c28d196"
  instance_type           = "t2.micro"
  key_name                = "vibin_keypair"
  subnet_id              = "subnet-05b7504fbe78a9951"
  vpc_security_group_ids = ["sg-0ace494247ec09d6c"]
}

# Reference existing resource group
data "azurerm_resource_group" "rg" {
  name = "Vibin"
}

# Reference existing virtual network
data "azurerm_virtual_network" "vnet" {
  name                = "vnet1"
  resource_group_name = data.azurerm_resource_group.rg.name
}

# Reference existing default subnet within the VNet
data "azurerm_subnet" "subnet" {
  name                 = "default"
  virtual_network_name = data.azurerm_virtual_network.vnet.name
  resource_group_name  = data.azurerm_resource_group.rg.name
}

# Create a network interface for the VM
resource "azurerm_network_interface" "vm_nic" {
  name                = "nic-${terraform.workspace}"
  location            = data.azurerm_resource_group.rg.location
  resource_group_name = data.azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create a Linux Virtual Machine in Azure
resource "azurerm_linux_virtual_machine" "vm" {
  name                = "vibin-vm"
  resource_group_name = "vibin"
  location            = "UK South"
  size                = "Standard_B1s"
  admin_username      = "vibinadmin"
  admin_password      = "Vibin@1234"
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
