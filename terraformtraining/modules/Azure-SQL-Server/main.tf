<<<<<<< HEAD
# resource "azurerm_mssql_server" "example" {
#   name                         = var.SQLservername
#   resource_group_name          = var.resource_group_name
#   location                     = var.location
#   version                      = var.sqlversion
#   administrator_login          = var.administrator_login
#   administrator_login_password = var.administrator_login
#   minimum_tls_version          = var.minimum_tls_version

#   tags = {
#     environment = var.environment
#   }

#   dynamic "azuread_administrator" {
#     for_each = var.azuread_administrator ? [1] : []

#     content {
#       login_username = "AzureAD Admin"
#       object_id      = "00000000-0000-0000-0000-000000000000"
#     }
#     connection_policy = "Default" # You can change this to "Proxy" or "Redirect" if needed
#     public_network_access_enabled = false # Set to false if you want to disable public network access
#     outbound_network_restriction_enabled = false # Set to true if you want to restrict outbound network traffic

#     # primary_user_assigned_identity_id = 
#   }

# }
resource "azurerm_mssql_server" "SQLserver" {
  name                         = var.SQLservername
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version             = var.sqlserverversion
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version

  tags = {
    environment = var.environment
  }

  dynamic "azuread_administrator" {
    for_each = var.enable_azuread_administrator ? [1] : []
    content {
      login_username                    = var.enable_azuread_administrator.null
      object_id                         = var.enable_azuread_administrator.null  
    }
  }
}
resource "azurerm_private_endpoint" "db-private-endpoint" {
  name                = var.priviteendpointname
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet2id

  private_service_connection {
    is_manual_connection           = false
    name                           = "server-resources"
    private_connection_resource_id = azurerm_mssql_server.SQLserver.id
    subresource_names              = ["sqlServer"]
  }
}
=======
# resource "azurerm_mssql_server" "example" {
#   name                         = var.SQLservername
#   resource_group_name          = var.resource_group_name
#   location                     = var.location
#   version                      = var.sqlversion
#   administrator_login          = var.administrator_login
#   administrator_login_password = var.administrator_login
#   minimum_tls_version          = var.minimum_tls_version

#   tags = {
#     environment = var.environment
#   }

#   dynamic "azuread_administrator" {
#     for_each = var.azuread_administrator ? [1] : []

#     content {
#       login_username = "AzureAD Admin"
#       object_id      = "00000000-0000-0000-0000-000000000000"
#     }
#     connection_policy = "Default" # You can change this to "Proxy" or "Redirect" if needed
#     public_network_access_enabled = false # Set to false if you want to disable public network access
#     outbound_network_restriction_enabled = false # Set to true if you want to restrict outbound network traffic

#     # primary_user_assigned_identity_id = 
#   }

# }
resource "azurerm_mssql_server" "SQLserver" {
  name                         = var.SQLservername
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version             = var.sqlserverversion
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  minimum_tls_version          = var.minimum_tls_version

  tags = {
    environment = var.environment
  }

  dynamic "azuread_administrator" {
    for_each = var.enable_azuread_administrator ? [1] : []
    content {
      login_username                    = var.enable_azuread_administrator.null
      object_id                         = var.enable_azuread_administrator.null  
    }
  }
}
resource "azurerm_private_endpoint" "db-private-endpoint" {
  name                = var.priviteendpointname
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet2id

  private_service_connection {
    is_manual_connection           = false
    name                           = "server-resources"
    private_connection_resource_id = azurerm_mssql_server.SQLserver.id
    subresource_names              = ["sqlServer"]
  }
}
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
