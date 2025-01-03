terraform {
  backend "azurerm" {
    resource_group_name  = "project-setup-1"
    storage_account_name = "v82tfstates"
    container_name       = "tfstate"
    key                  = "example.tfstate"
  }
}

output "test" {
  value = "Hello"
}
