<<<<<<< HEAD
output "vnetid" {
  value = azurerm_virtual_network.example.id
}
# output "subnet1id" {
#   value = azurerm_subnet.example.id
# }
# output "subnet2id" {
#   value = azurerm_subnet.subnet2.id
# }
# output "subnet3id" {
#   value = azurerm_subnet.subnet3.id
# }
# output "subnet4id" {
#   value = azurerm_subnet.subnet4.id
# }
# output "subnet_ids" {
#   value = {
#     for subnet in azurerm_subnet.subnet :
#     subnet.key => subnet.id
#   }
# }
output "subnet_ids" {
  value = {
    for key, subnet in azurerm_subnet.subnet :
    key => subnet.id
  }
}

=======
output "vnetid" {
  value = azurerm_virtual_network.example.id
}
output "subnet1id" {
  value = azurerm_subnet.example.id
}
output "subnet2id" {
  value = azurerm_subnet.subnet2.id
}
output "subnet3id" {
  value = azurerm_subnet.subnet3.id
}
output "subnet4id" {
  value = azurerm_subnet.subnet4.id
}
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
