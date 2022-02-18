provider "azurerm" {
  features {}
}

resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  number  = false
}

#create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}
#create azure storage account
resource "azurerm_storage_account" "storage_account" {
  name                = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.resource_group.name

  location                 = var.location
  account_kind             = var.storage_account_kind
  account_tier              = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type


  static_website {
    index_document     = var.storage_website_index_document
    error_404_document = var.storage_website_error_404_document
  }
}
