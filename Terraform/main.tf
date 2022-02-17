terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformTest"
    storage_account_name = "terraformstatepocshj"
    container_name       = "tfstatedevops"
    key                  = "tfstatedevops.tfstate"
  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~>2.0"
    }
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
resource "azurerm_sql_server" "sqlserver" {
  name                              = "terraformtestshj"
  resource_group_name               = "tamops"
  location                          = "West Europe"
  version                           = "12.0"
  administrator_login               = "admin"
  administrator_login_password      = "Corp123!"
}
resource "azurerm_sql_database" "appdb" {
  name                              = "test"
  resource_group_name               = "tamops"
  location                          = "West Europe"
  server_name                       = "terraformtestshj"
  edition                           = "Basic"
  collation                         = "SQL_Latin1_General_CP1_CI_AS"
  create_mode                       = "Default"
  requested_service_objective_name  = "Basic"
  tags = {
    environment = "dev"
  }
}
resource "azurerm_sql_firewall_rule" "fw_connections_todb" {
  name                = "allow-azure-services"
  resource_group_name = "tamops"
  server_name         = "terraformtestshj"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}