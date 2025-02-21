terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.18.0"
    }
     }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "202d4be6-e0dd-4b9e-84b7-e235d53271a8"
}


resource "azurerm_resource_group" "rg" {
  name = "rg-new"
  location = "eastus"
}

resource "azurerm_virtual_network" "vnet" {
  name = "vnet-new"
  address_space = ["10.0.0.0/16"]
  location = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name 
  tags = {
    Env = "Prod"
    Dept ="Finance"
  }
 lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      tags,
    ]
  }
}
