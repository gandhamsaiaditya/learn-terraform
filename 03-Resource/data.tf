 data "azurerm_resource_group" "example" {
  name = "Project-Setup-1"
}

 output "rg" {
   value = data.azurerm_resource_group.example
 }


