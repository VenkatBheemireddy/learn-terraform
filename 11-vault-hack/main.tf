data "azurerm_public_ip" "example" {
  name                = "workstation"
  resource_group_name = "project-setup-1"
}

output "domain_name_label" {
  value = data.azurerm_public_ip.example.domain_name_label
}

output "public_ip_address" {
  # value = data.azurerm_public_ip.example.ip_address
  value = data.azurerm_public_ip.example
}

provider "azurerm" {
  features {}
  subscription_id = "9af0e83a-d3ee-4c3c-a244-3274a3457024" # Change it to your subscription id
}
