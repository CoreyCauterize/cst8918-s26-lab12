terraform {
  required_version = "~> 1.5"
  backend "azurerm" {
    resource_group_name  = "chen1101-githubactions-rg"
    storage_account_name = "chen1101githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.96.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3"
    }
  }
}