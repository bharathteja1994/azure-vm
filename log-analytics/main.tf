provider "azurerm" {
  features {}
}

resource "azurerm_log_analytics_workspace" "example" {
  name                = var.workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.example.id
}

output "workspace_primary_shared_key" {
  value = azurerm_log_analytics_workspace.example.primary_shared_key
}
