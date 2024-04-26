data "azurerm_network_interface" "nsgdata" {
  name                = "rilnic"
  resource_group_name = "odsc"
}

data "azurerm_subnet" "datasubnet" {
  name                 = "rilsubnet"
  virtual_network_name = "ril-network"
  resource_group_name  = "odsc"
}