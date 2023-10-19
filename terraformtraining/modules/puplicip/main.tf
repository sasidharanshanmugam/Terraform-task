<<<<<<< HEAD
resource "azurerm_public_ip" "example" {
  name                = var.puplicipname
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Training"
  }
=======
resource "azurerm_public_ip" "example" {
  name                = var.puplicipname
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

  tags = {
    environment = "Training"
  }
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}