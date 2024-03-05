terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "=3.42.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "~>4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "#{RESOURCE_GROUP}#"
    storage_account_name = "#{STORAGE_ACCOUNT}#"
    container_name       = "#{STORAGE_CONTAINER}#"
    key                  = "terraform.tfstate"
    access_key           = "#{ACCESS_KEY}#"
  }
}

provider "azurerm" {
features {}
  subscription_id = "#{SUBSCRIPTION_ID}#"
  tenant_id = "#{TENANT_ID}#"
  client_id = "#{CLIENT_ID}#"
  client_secret = "#{CLIENT_SECRET}#"
}

