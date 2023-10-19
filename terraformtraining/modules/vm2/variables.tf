<<<<<<< HEAD
variable "azureuser" {
  description = "Username for the virtual Machine"
  default     = "azureuser"
}
variable "no_of_vms" {
  description = " Number of VM's to be used"
  default     = 2
}

variable "mysql_version" {
  description = "Mssql Version"
  default     = "12.0"
}

variable "mysql_username" {
  description = "mssql username"
  default     = "user"
}
variable "mysql_password" {
  default = ""
}
variable "my_ip" {
  description = "my_ip"
  default = "101.188.67.134"
=======
variable "azureuser" {
  description = "Username for the virtual Machine"
  default     = "azureuser"
}
variable "no_of_vms" {
  description = " Number of VM's to be used"
  default     = 2
}

variable "mysql_version" {
  description = "Mssql Version"
  default     = "12.0"
}

variable "mysql_username" {
  description = "mssql username"
  default     = "user"
}
variable "mysql_password" {
  default = ""
}
variable "my_ip" {
  description = "my_ip"
  default = "101.188.67.134"
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}