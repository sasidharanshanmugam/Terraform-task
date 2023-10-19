<<<<<<< HEAD
variable "nsgname" {
  type = string
  default = "Az-task-vm"
}
variable "location" {
  type = string
  default = "East US"
}
variable "resource_group_name" {
  type = string
  default = "value"
}
variable "subnet_id" {
  type = string
}
variable "network_interface_id" {
  type    = list(string)
=======
variable "nsgname" {
  type = string
  default = "Az-task-vm"
}
variable "location" {
  type = string
  default = "East US"
}
variable "resource_group_name" {
  type = string
  default = "value"
}
variable "subnet_id" {
  type = string
}
variable "network_interface_id" {
  type    = string
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}