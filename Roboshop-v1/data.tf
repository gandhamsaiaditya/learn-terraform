data "azurerm_resource_group" "rg" {
  name     = "Vintech"
 }

data "azurerm_subnet" "internal" {
  name                 = "default"
  resource_group_name  = data.azurerm_resource_group.rg.name
  virtual_network_name = "Workshop-vnet"

}