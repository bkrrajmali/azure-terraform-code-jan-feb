terraform {
  required_version = ">=1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.1.0" #
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = "202d4be6-e0dd-4b9e-84b7-e235d53271a8"
}