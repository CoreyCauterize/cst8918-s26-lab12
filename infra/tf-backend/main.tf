# Configure the Terraform runtime requirements.
terraform {
  required_version = ">= 1.1.0"

  required_providers {
    # Azure Resource Manager provider and version
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.3"
    }
  }

}


# Define providers and their config params
provider "azurerm" {
  # Leave the features block empty to accept all defaults
  features {}
}

provider "cloudinit" {
  # Configuration options
}

variable "label_prefix" {
  description = "A prefix to add to all resources"
  type        = string
  default     = "chen1101"
}
variable "region" {
  description = "Location of the region"
  type        = string
  default     = "canadacentral"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.label_prefix}-githubactions-rg"
  location = var.region
  tags = {
    Class      = "CST8918"
    Assignment = "Lab"
    Lab        = "A12"
  }
}

resource "azurerm_storage_account" "storage" {
  name                     = "${var.label_prefix}-githubactions"
  location                 = var.region
  resource_group_name      = azurerm_resource_group.rg.name
  account_kind             = "BlobStorage"
  account_tier             = "Standard"
  account_replication_type = "LRS"
  access_tier              = "Cold"
  min_tls_version          = "TLS1_2"
  tags = {
    Class      = "CST8918"
    Assignment = "Lab"
    Lab        = "A12"
  }
}

resource "azurerm_storage_container" "container" {
  name               = "tfstate"
  storage_account_id = azurerm_storage_account.storage.storage_account_id

}