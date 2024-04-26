resource "azurerm_key_vault" "rilkv" {
  name                        = "rilkeyvault"
  location                    = "westus "
  resource_group_name         = "odsc"
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

resource "azurerm_key_vault_secret" "rilkvsecret" {
  name         = var.name
  value        = var.value
  key_vault_id = azurerm_key_vault.rilkv[each.key].id
}