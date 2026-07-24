# Configure the Terraform runtime requirements.

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
  name     = "${var.label_prefix}-A12-RG"
  location = var.region
  tags = {
    Class      = "CST8918"
    Assignment = "Lab"
    Lab        = "A12"
  }
}