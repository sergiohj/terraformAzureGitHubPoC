terraform {
  backend "azurerm" {
    resource_group_name  = var.terraformrgname
    storage_account_name = var.terraformstorageaccountname
    container_name       = var.terraformcontainername
    key                  = var.keytfstate
  }
}
provider "azurerm" {
  features {}
}
data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "mainrg" {
  name     = var.rgname
  location = var.region
}
resource "azurerm_mssql_server" "sqlserver" {
  name                         = "mssqlservershj"
  resource_group_name          = "tamops"
  location                     = "West Europe"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}
resource "azurerm_mssql_database" "test" {
  name           = "acctest-db-d"
  server_id      = azurerm_mssql_server.sqlserver.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  license_type   = "LicenseIncluded"
  max_size_gb    = 4
  read_scale     = true
  sku_name       = "BC_Gen5_2"
  zone_redundant = true
  tags = {
    foo = "bar"
  }
}
resource "azurerm_key_vault" "keyvaulttest" {
  name                        = "mykeyvaultshjpoc"
  location                    = azurerm_resource_group.mainrg.location
  resource_group_name         = azurerm_resource_group.mainrg.name
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