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

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.label_prefix}-A12-VNET"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
  tags = {
    Class      = "CST8918"
    Assignment = "Lab"
    Lab        = "A12"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.label_prefix}-A12-SUBNET"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}