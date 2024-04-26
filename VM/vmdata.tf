data "azurerm_network_interface" "datanic" {
  name                = "rilnic"
  resource_group_name = "odsc"
}