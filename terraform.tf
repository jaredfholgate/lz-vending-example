terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.0"
    }
  }
  backend "azurerm" {}
}

provider "azapi" {
}

provider "azurerm" {
  features {}
}