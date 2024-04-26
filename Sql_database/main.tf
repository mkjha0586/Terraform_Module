resource "azurerm_sql_database" "rildatabase" {
  name                = "rilsqldatabase"
  resource_group_name = "odsc"
  location            = "westus"
  server_name         = "rilmysqlserver"

  tags = {
    environment = "production"
  }
}