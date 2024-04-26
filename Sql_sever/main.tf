resource "azurerm_sql_server" "rilsqlserver" {
  name                         = "rilmysqlserver"
  resource_group_name          = "odsc"
  location                     = "westus"
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
}