terraform {
  required_providers {
    azurerm={
        source ="hashicorp/azurerm",
        version = "~> 2.65"
    }
  }
/*
Before writing backend code please create below on azure

1.Create a resource group
2.create azure storage account
3.create azure container in storage account


*/

  backend "azurerm" {
    resource_group_name="terraform-storage-rg"
    storage_account_name = "terraformstate551"
    container_name="terraformstate551"
    key="terraform.tfstate"
  }
}
provider "azurerm" {
  features {
  }
}

