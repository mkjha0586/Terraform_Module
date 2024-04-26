data "azurerm_subnet" "rilsubnet" {
  for_each             = var.ril
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}