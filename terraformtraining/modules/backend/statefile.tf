<<<<<<< HEAD
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "Devopstraining123"
      storage_account_name = "aztaskstorageaccount1"
      container_name       = "statefile"
      # key                  = "BWvwpEP5tQxN6+DcLNsTGtOnzG9YUcvn0SUswb1/1hyq8uhhgUwZQQQwSZhspoVQNsmS0zXaMb9P+AStUEiH+Q=="
       key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
=======
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "Devopstraining123"
      storage_account_name = "aztaskstorageaccount1"
      container_name       = "statefile"
      # key                  = "BWvwpEP5tQxN6+DcLNsTGtOnzG9YUcvn0SUswb1/1hyq8uhhgUwZQQQwSZhspoVQNsmS0zXaMb9P+AStUEiH+Q=="
       key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
>>>>>>> 1f28a3a34f47dfd6326a2f214d924c99c128e24a
}