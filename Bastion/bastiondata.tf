data "azurerm_subnet" "datasubnet" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "ril-network"
  resource_group_name  = "odsc"
}

data "azurerm_public_ip" "datapip" {
  name                = "rilpip"
  resource_group_name = "odsc"
}