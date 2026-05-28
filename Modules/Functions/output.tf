output "id" {
  value = var.os_type == "Linux" ? azurerm_linux_function_app.this[0].id : azurerm_windows_function_app.this[0].id
}

output "name" {
  value = var.name
}

output "principal_id" {
  value = var.os_type == "Linux" ? azurerm_linux_function_app.this[0].identity[0].principal_id : azurerm_windows_function_app.this[0].identity[0].principal_id
}

output "default_hostname" {
  value = var.os_type == "Linux" ? azurerm_linux_function_app.this[0].default_hostname : azurerm_windows_function_app.this[0].default_hostname
}
