resource "azurerm_network_security_group" "rilnsg" {
  name                = var.name
  location            = "westus"
  resource_group_name = "ril_RG"

  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  tags = {
    environment = "Production"
  }
}
resource "azurerm_subnet_network_security_group_association" "iplassocate" {
  subnet_id                 = data.azurerm_subnet.datasubnet.id
  network_security_group_id = azurerm_network_security_group.rilnsg.id

}
resource "azurerm_network_interface_security_group_association" "iplnicassocate" {
  network_interface_id      = data.azurerm_network_interface.nsgdata.id

  network_security_group_id = azurerm_network_security_group.rilnsg.id
}