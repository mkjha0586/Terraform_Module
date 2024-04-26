resource "azurerm_virtual_network" "rilvnet" {
  for_each            = var.ril
  name                = each.value.vnet_name
  location            = each.value.vnet_location
  resource_group_name = each.value.rg_name
  address_space       = each.value.address_space 
  dns_servers         = each.value.dns_servers
}