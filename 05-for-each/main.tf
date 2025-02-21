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

resource "azurerm_resource_group" "rg1" {
  for_each = {
    "dc1apps" = "eastus"
    "dc2apps" = "westus"
    "dc3apps" = "centralus"
  }
  name = "${each.key}-rg"
  location = each.value
}