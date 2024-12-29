data "azurerm_resource_group" "example" {
  name = "project-setup-1"
}


output "rg" {
  value = data.azurerm_resource_group.example
}

provider "azurerm" {
  features {}
  subscription_id = "9af0e83a-d3ee-4c3c-a244-3274a3457024"
}