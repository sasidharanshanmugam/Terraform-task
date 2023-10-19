<<<<<<< HEAD
variable "vmname" {
  type = list(string)
  default = ["Az-task-vm12",
              "AZvmtask34"]
}
variable "location" {
  type = string
  default = "East US"
}
variable "resource_group_name" {
  type = string
  default = "value"
}
variable "network_interface_ids" {
  type    = list(string)
}
# variable "Extensionname" {
#   type = string
# }
variable "admin_username" {
  type = string
  default = "sasidharan"
}
variable "admin_password" {
  type = string
  default = "Sasidharan*1998"
=======
variable "vmname" {
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
variable "network_interface_ids" {
  type    = list(string)
}
variable "Extensionname" {
  type = string
}
variable "admin_username" {
  type = string
  default = "sasidharan"
}
variable "admin_password" {
  type = string
  default = "Sasidharan*1998"
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}