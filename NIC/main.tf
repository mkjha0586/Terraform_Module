resource "azurerm_network_interface" "iplnic" {
  for_each = var.ril
  name                = each.value.nic_name 
  location            = each.value.nic_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.rilsubnet[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}