resource "azurerm_virtual_network" "vnet" {
  name                = "infra_vnet"
  address_space       = ["10.0.0.0/16"]
  location            =var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "az_subnet" {
  name                 = "infra_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

