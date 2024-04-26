resource "azurerm_bastion_host" "bastion1" {

  for_each = var.ril
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
   sku="Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.datasubnet.id
    public_ip_address_id = data.azurerm_public_ip.datapip.id
  }
}