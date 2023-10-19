<<<<<<< HEAD
module "resourcegroup" {
  source = "./modules/resourcegroup"
  resource_group_name = "Devops12"
}
module "vnnet" {
  source = "./modules/Vnet"
  vnetname =  "azdemovnet"
  location            = "East US" 
  resource_group_name = module.resourcegroup.resourcegroupname
  vnet_address_space = ["10.0.0.0/16"]
  subnets = {
    "gateway_subnet"=0
    "default_subnet"=1
    "db_subnet"=2
  }
}
module "nic" {
  source = "./modules/NIC"
  # puplicip  = "azpupiptask"
  # nicname                = "aztasknic"
  location               = "East US"
  resource_group_name = module.resourcegroup.resourcegroupname
  subnetid =  module.vnnet.subnet_ids["default_subnet"]
}
module "VM" {
  source = "./modules/VM"
  # vmname = "aztaskvmone2"
  network_interface_ids = module.nic.network_interface_ids
  resource_group_name = module.resourcegroup.resourcegroupname
  # Extensionname = "nginxcs"
}
module "nsg" {
  source = "./modules/NSG"
  resource_group_name = module.resourcegroup.resourcegroupname
  subnet_id = module.vnnet.subnet_ids["default_subnet"]
  network_interface_id = module.nic.network_interface_ids
}

module "sqlserver" {
  source = "./modules/Azure-SQL-Server"
  SQLservername                = "sagesqlserver1998"
  resource_group_name          = module.resourcegroup.resourcegroupname
  location                     = "East US"
  sqlserverversion             = "12.0"
  administrator_login          = "sagesoftware"
  administrator_login_password = "Welcome2Linux!"
  minimum_tls_version          = "1.2"
  environment                  = "Training"
  enable_azuread_administrator = false
  subnet2id = module.vnnet.subnet_ids[db_subnet]
}
module "SQLDB" { 
  source = "./modules/Azure-SQL-DB"
  sqlservername  = "sage-db23"
  sqlserver_id   = module.sqlserver.sagesqlserverid
  license_type   = "BasePrice"
  max_size_gb    = "1"
  read_scale     = false
  sku_name       = "Basic"
  zone_redundant = false
  environment = "Training"
}
module "public_ip_address" {
  source = "./modules/puplicip"
  puplicipname = "LBpupip"
  resource_group_name = module.resourcegroup.resourcegroupname
  location = "East US"
}
module "Loadbalancer" {
  source = "./modules/Loadbalancer"
  load_balancer_name = "azvmtasklb"
  public_ip_address_id = module.public_ip_address.LBIp
  location = "East US"
  resource_group_name = module.resourcegroup.resourcegroupname
  network_interface_id = module.nic.network_interface_ids
}
module "webtraffic" {
 source = "./modules/Webtraffic"  
 trafficmanagername = "aztaskwebtraffic"
 resource_group_name = module.resourcegroup.resourcegroupname
 public_ip_id = module.public_ip_address.LBIp
=======
module "resourcegroup" {
  source = "./modules/resourcegroup"
  resource_group_name = "Devopstraining123"
}
module "vnnet" {
  source = "./modules/Vnet"
  vnetname =  "azdemovnet"
  location            = "East US" 
  resource_group_name = module.resourcegroup.resourcegroupname
}
module "nic" {
  source = "./modules/NIC"
  puplicip  = "azpupiptask"
  nicname                = "aztasknic"
  location               = "East US"
  resource_group_name = module.resourcegroup.resourcegroupname
  subnetid = module.vnnet.subnet1id
}
module "VM" {
  # count = "2"
  source = "./modules/VM"
  vmname = "aztaskvm1"
  network_interface_ids = [module.nic.network_interface_ids]
  resource_group_name = module.resourcegroup.resourcegroupname
  Extensionname = "nginxcs"
}
module "nsg" {
  source = "./modules/NSG"
  resource_group_name = module.resourcegroup.resourcegroupname
  subnet_id = module.vnnet.subnet1id
  network_interface_id = module.nic.network_interface_ids
}
module "VM2" {
  source = "./modules/VM"
  vmname = "aztaskVM2"
  Extensionname = "nginx12"
  network_interface_ids = [module.nic.network_interface_ids]
  resource_group_name = module.resourcegroup.resourcegroupname
}
module "sqlserver" {
  source = "./modules/Azure-SQL-Server"
  SQLservername                = "sagesqlserver1998"
  resource_group_name          = module.resourcegroup.resourcegroupname
  location                     = "East US"
  sqlserverversion             = "12.0"
  administrator_login          = "sagesoftware"
  administrator_login_password = "Welcome2Linux!"
  minimum_tls_version          = "1.2"
  environment                  = "Training"
  enable_azuread_administrator = false
  subnet2id = module.vnnet.subnet2id
}
module "SQLDB" { 
  source = "./modules/Azure-SQL-DB"
  sqlservername  = "sage-db23"
  sqlserver_id   = module.sqlserver.sagesqlserverid
  license_type   = "BasePrice"
  max_size_gb    = "1"
  read_scale     = false
  sku_name       = "Basic"
  zone_redundant = false
  environment = "Training"
}
module "public_ip_address" {
  source = "./modules/puplicip"
  puplicipname = "LBpupip"
  resource_group_name = module.resourcegroup.resourcegroupname
  location = "East US"
}
module "Loadbalancer" {
  source = "./modules/Loadbalancer"
  load_balancer_name = "azvmtasklb"
  public_ip_address_id = module.public_ip_address.LBIp
  location = "East US"
  resource_group_name = module.resourcegroup.resourcegroupname
  network_interface_id = module.nic.network_interface_ids
}
module "webtraffic" {
 source = "./modules/Webtraffic"  
 trafficmanagername = "aztaskwebtraffic"
 resource_group_name = module.resourcegroup.resourcegroupname
 public_ip_id = module.public_ip_address.LBIp
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}