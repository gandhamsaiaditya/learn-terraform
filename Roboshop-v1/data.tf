data "azurerm_resource_group" "rg" {
  name     = "Vintech"
 }

data "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = "Vintech-network"
  address_prefixes     = ["10.0.2.0/24"]
}