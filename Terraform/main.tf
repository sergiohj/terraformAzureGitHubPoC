terraform {
  backend "azurerm" {
    resource_group_name  = "TerraformTest"
    storage_account_name = "terraformstatepocshj"
    container_name       = "tfstatedevops"
    key                  = "tfstatedevops.tfstate"
  }
}