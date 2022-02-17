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
  name                         = "mssqlserver"
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
  name                = "myexamplesqldatabase"
  resource_group_name = "tamops"
  location            = "West US"
  server_name         = "mssqlserver"
  tags = {
    environment = "production"
  }
}