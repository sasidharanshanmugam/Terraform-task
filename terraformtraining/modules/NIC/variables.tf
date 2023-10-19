<<<<<<< HEAD
variable "nicname" {
  type = list(string)
  default = ["vmnicekls","vm2nic"]
}
variable "location" {
  type = string
  default = "West Europe "
}
variable "resource_group_name" {
  type = string
  default = "example-resources-14"
}
variable "subnetid" {
  type= string
}
variable "puplicip" {
 type = list(string)
 default = ["pupipts1", "pupipts2"] 
=======
variable "nicname" {
  type = string
  default = "vmnicekls"
}
variable "location" {
  type = string
  default = "West Europe "
}
variable "resource_group_name" {
  type = string
  default = "example-resources-14"
}
variable "subnetid" {
  type= string
  default = "/subscriptions/fff309a9-2887-407d-b64d-e074e3d92e5b/resourceGroups/example-resources-14/providers/Microsoft.Network/virtualNetworks/acctvn/subnets/acctsub"
}
variable "puplicip" {
 type = string
 default = "value" 
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}