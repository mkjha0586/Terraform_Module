resource "azurerm_resource_group" "IPL" {
  for_each = var.ril
  name     = each.value.rg_name
  location = each.value.rg_location
}