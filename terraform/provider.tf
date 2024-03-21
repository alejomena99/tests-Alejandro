terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.42.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "#{RESOURCE_GROUP}#"
    storage_account_name = "#{STORAGE_ACCOUNT}#"
    container_name       = "#{STORAGE_CONTAINER}#"
    key                  = "terraform.tfstate"
    access_key           = "wm+R35MVS3hUBA7mbosY7vT/bOVuCTIn/044nntAZ4WZNmR1CUvW7dp10L55+dfA95KRtlv+GigU+AStd8C6iQ=="
  }
}

provider "azurerm" {
features {}
  subscription_id = "#{SUBSCRIPTION_ID}#"
  tenant_id = "#{TENANT_ID}#"
  client_id = "#{CLIENT_ID}#"
  client_secret = "#{CLIENT_SECRET}#"
}

