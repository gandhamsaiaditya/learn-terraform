 data "azurerm_resource_group" "example" {
  name = "Project-Setup"
}

output "rg" {
  value = data.azurerm_resource_group.example
}
provider "azurerm" {

 features {}
 subcription_id="a92e07d8-3cdd-4fda-bb98-99b2dddb739c"
}