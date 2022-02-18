module "azure_static_website" {
  source = "./modules/azure-static-website"

  #resource Group
  location="eastus"
  resource_group_name="myrg1"

  #storage account
  storage_account_name="staticwebsite551"
  storage_account_tier="Standard"
  storage_account_replication_type="LRS"
  storage_account_kind="StorageV2"
  storage_website_index_document="index.html"
  storage_website_error_404_document="error.html"
}