terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformTest"
    storage_account_name = "terraformstatepocshj"
    container_name       = "tfstatedevops"
    key                  = "tfstatedevops.tfstate"
  }
}
provider "azurerm" {
  features {}
}
data "azurerm_client_config" "current" {}
resource "azurerm_resource_group" "tamops" {
  name     = "tamops"
  location = "West Europe"
}
resource "azurerm_sql_server" "example" {
  name                         = "mssqlservershj"
  resource_group_name          = "tamops"
  location                     = "West Europe"
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"
  tags = {
    environment = "production"
  }
}
resource "azurerm_sql_database" "example" {
  name                = "myexamplesqldatabaseshj"
  resource_group_name = "tamops"
  location            = "West US"
  server_name         = "mssqlservershj"
  tags = {
    environment = "production"
  }
}
resource "azurerm_sql_firewall_rule" "fw_connections_todb" {
  name                = "allow-azure-services"
  resource_group_name = "tamops"
  server_name         = "mssqlservershj"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}