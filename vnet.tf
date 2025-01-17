resource "azurerm_virtual_network" "vnet" {
  name                = "infra1_vnet"
  address_space       = ["11.0.0.0/16"]
  location            =var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "az_subnet" {
  name                 = "infra1_subnet"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["11.0.0.0/24"]
}

