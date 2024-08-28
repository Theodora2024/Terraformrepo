terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.0.1"
    }
  }
}

provider "azurerm" {
features {}
}
resource "azurerm_resource_group" "terraformrg" {
  name = "rgterraform"

location = "Japan East"
}
resource "azurerm_virtual_network" "terraformvnet" {
  name = vnetterraform
address_space = ["10.0.0.0/16"]
location = azurerm_resource_group.terraformrg.location
resource_group_name = azurerm_resource_group.terraformrg.name
}
resource "azurerm_subnet" "terraformsub" {
  name = subterraform
address_prefixes = ["10.0.2.0/24"]
resource_group_name = azurerm_resource_group.terraformrg.name
virtual_network_name = azurerm_virtual_network.terraformvnet
}