 data "azurerm_resource_group" "example" {
  name = "Project-Setup"
}

data "azurerm_subnet" "example" {
  name                 = "default"
  virtual_network_name = "workshop-vnet"
  resource_group_name  = "data.azurerm_resource_group.example.name"
}
