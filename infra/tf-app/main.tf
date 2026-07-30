# Configure the Terraform runtime requirements.

provider "cloudinit" {
  # Configuration options
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
