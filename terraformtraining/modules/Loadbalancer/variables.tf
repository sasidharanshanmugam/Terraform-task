<<<<<<< HEAD
variable "load_balancer_name" {
  type = string
  default = "aztasklb"
}
variable "resource_group_name" {
  type = string
  default = "Devopstraining123"
}
variable "location" {
  type = string
  default = "East US"
}
variable "public_ip_address_id" {
    type = string
}
# variable "backend_address_pool_ids" {
#   type = list(string)
# }
variable "network_interface_id" {
  type = list(string)
=======
variable "load_balancer_name" {
  type = string
  default = "aztasklb"
}
variable "resource_group_name" {
  type = string
  default = "Devopstraining123"
}
variable "location" {
  type = string
  default = "East US"
}
variable "public_ip_address_id" {
    type = string
}
# variable "backend_address_pool_ids" {
#   type = list(string)
# }
variable "network_interface_id" {
  type = string
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}