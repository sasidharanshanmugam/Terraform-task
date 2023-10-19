<<<<<<< HEAD
resource "azurerm_resource_group" "task-2" {
  location = "eastus"
  name     = "assesment-2"
}

# Creating Virtual Network
resource "azurerm_virtual_network" "network" {
  location            = azurerm_resource_group.task-2.location
  name                = "task-2"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.task-2.name
}

# Creating a  subnet for load balancer.
resource "azurerm_subnet" "gateway-subnet" {
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "gateway"
  resource_group_name  = azurerm_resource_group.task-2.name
  virtual_network_name = azurerm_virtual_network.network.name
}

# Creating a subnet for VM'st
resource "azurerm_subnet" "default-subnet" {
  address_prefixes     = ["10.0.1.0/24"]
  name                 = "default"
  resource_group_name  = azurerm_resource_group.task-2.name
  virtual_network_name = azurerm_virtual_network.network.name
}

resource "azurerm_subnet" "db-subet" {
  address_prefixes     = ["10.0.2.0/24"]
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.task-2.name
  virtual_network_name = azurerm_virtual_network.network.name
}

# Creating NIC's for VM's
resource "azurerm_network_interface" "NIC" {
  location            = azurerm_resource_group.task-2.location
  name                = "NIC-${count.index}"
  resource_group_name = azurerm_resource_group.task-2.name
  ip_configuration {
    name                          = "ifconfig"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.default-subnet.id
  }
  count = var.no_of_vms
}

# Creating a VM
resource "azurerm_linux_virtual_machine" "vm" {
  location       = azurerm_resource_group.task-2.location
  name           = "VM-${count.index}"
  admin_username = var.azureuser
  admin_password = "spr12345spr_A"
  network_interface_ids = [
    azurerm_network_interface.NIC[count.index].id
  ]
  resource_group_name             = azurerm_resource_group.task-2.name
  size                            = "standard_ds2_v2"
  disable_password_authentication = false
  # availability_set_id             = azurerm_availability_set.avset.id

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  custom_data =  base64encode( templatefile("templates/config.tftpl",{
    vm_no = count.index,
    # host =  azurerm_private_endpoint.db-private-endpoint.private_service_connection[0].private_ip_address,
    username = var.mysql_username
    password = var.mysql_password
  } ))


  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  count = var.no_of_vms
=======
resource "azurerm_resource_group" "task-2" {
  location = "eastus"
  name     = "assesment-2"
}

# Creating Virtual Network
resource "azurerm_virtual_network" "network" {
  location            = azurerm_resource_group.task-2.location
  name                = "task-2"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.task-2.name
}

# Creating a  subnet for load balancer.
resource "azurerm_subnet" "gateway-subnet" {
  address_prefixes     = ["10.0.0.0/24"]
  name                 = "gateway"
  resource_group_name  = azurerm_resource_group.task-2.name
  virtual_network_name = azurerm_virtual_network.network.name
}

# Creating a subnet for VM'st
resource "azurerm_subnet" "default-subnet" {
  address_prefixes     = ["10.0.1.0/24"]
  name                 = "default"
  resource_group_name  = azurerm_resource_group.task-2.name
  virtual_network_name = azurerm_virtual_network.network.name
}

resource "azurerm_subnet" "db-subet" {
  address_prefixes     = ["10.0.2.0/24"]
  name                 = "db-subnet"
  resource_group_name  = azurerm_resource_group.task-2.name
  virtual_network_name = azurerm_virtual_network.network.name
}

# Creating NIC's for VM's
resource "azurerm_network_interface" "NIC" {
  location            = azurerm_resource_group.task-2.location
  name                = "NIC-${count.index}"
  resource_group_name = azurerm_resource_group.task-2.name
  ip_configuration {
    name                          = "ifconfig"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.default-subnet.id
  }
  count = var.no_of_vms
}

# Creating a VM
resource "azurerm_linux_virtual_machine" "vm" {
  location       = azurerm_resource_group.task-2.location
  name           = "VM-${count.index}"
  admin_username = var.azureuser
  admin_password = "spr12345spr_A"
  network_interface_ids = [
    azurerm_network_interface.NIC[count.index].id
  ]
  resource_group_name             = azurerm_resource_group.task-2.name
  size                            = "standard_ds2_v2"
  disable_password_authentication = false
  # availability_set_id             = azurerm_availability_set.avset.id

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }
  custom_data =  base64encode( templatefile("templates/config.tftpl",{
    vm_no = count.index,
    # host =  azurerm_private_endpoint.db-private-endpoint.private_service_connection[0].private_ip_address,
    username = var.mysql_username
    password = var.mysql_password
  } ))


  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }
  count = var.no_of_vms
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}