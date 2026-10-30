
terraform {
  required_version = "1.17.1"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.43.0"
    }
  }

  cloud {
    organization = "dan_testing"

    workspaces {
      name = "Hands-On_With_Terraform_On_Azure"
    }
  }
}

provider "azurerm" {
  features {}
 
}

resource "azurerm_resource_group" "rg" {
  name     = "813-e0a4c16d-hands-on-with-terraform-on-azure"
  location = "southcentralus"
}

module "securestorage" {
  source               = "app.terraform.io/dan_testing/securestorage/azurerm"
  version              = "1.0.0"
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_name = "danterraformstorage12345"
}
