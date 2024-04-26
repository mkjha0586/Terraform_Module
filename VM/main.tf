resource "azurerm_linux_virtual_machine" "iplvm" {
  for_each                        = var.ril
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.vm_location
  size                            = each.value.vm_size
  admin_username                  = each.value.admin_username
  admin_password                  = each.value.admin_password
  disable_password_authentication = false
  network_interface_ids           = [data.azurerm_network_interface.datanic.id]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }
}