<<<<<<< HEAD
variable "sqlservername" {
  type = string
  default = "sage-db"
}
variable "sqlserver_id" {
  type = string
}
variable "license_type" {
  type = string
  default = "BasePrice"
}
variable "max_size_gb" {
  type = string
  default = "1"
}
variable "read_scale" {
  type = bool
  default = false
}
variable "sku_name" {
  type = string
  default = "Basic"
}
variable "zone_redundant" {
  type = bool
  default = true
}
variable "environment" {
  type = string
  default = "Development"
=======
variable "sqlservername" {
  type = string
  default = "sage-db"
}
variable "sqlserver_id" {
  type = string
}
variable "license_type" {
  type = string
  default = "BasePrice"
}
variable "max_size_gb" {
  type = string
  default = "1"
}
variable "read_scale" {
  type = bool
  default = false
}
variable "sku_name" {
  type = string
  default = "Basic"
}
variable "zone_redundant" {
  type = bool
  default = true
}
variable "environment" {
  type = string
  default = "Development"
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}