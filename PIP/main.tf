resource "azurerm_public_ip" "rilpip" {
  for_each            = var.ril
  name                = each.value.pip_name
  location            = each.value.pip_location
  resource_group_name = each.value.rg_name
  allocation_method   = each.value.allocation_method
  sku                 = each.value.sku
}