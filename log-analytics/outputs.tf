output "workspace_id" {
  value = azurerm_log_analytics_workspace.example.id
}

output "workspace_primary_shared_key" {
  value = azurerm_log_analytics_workspace.example.primary_shared_key
}
