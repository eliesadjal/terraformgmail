terraform {

  required_version = ">=0.12"
  
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rgtest" {
  name     = "rgtest"
  location = "France Central"
}

resource "azurerm_virtual_network" "vnettest" {
  name                = "vnettest"
  location            = "France Central"
  resource_group_name = "rgtest"
  address_space       = ["10.1.0.0/16"]

  subnet {
    name           = "subnet1test"
    address_prefix = "10.1.1.0/24"
  }

  subnet {
    name           = "subnet2test"
    address_prefix = "10.1.2.0/24"
  }
}