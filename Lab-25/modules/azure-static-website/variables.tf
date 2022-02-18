variable "location"{
    description = "The Azure Region in which all resources groups should be created."
    type=string
}
variable "resource_group_name"{
    description = "The name of resource group"
    type=string
}
variable "storage_account_name"{
    description = "storage account name"
    type=string
}
variable "storage_account_tier"{
    description = "storage account tier"
    type=string
}
variable "storage_account_replication_type"{
    description = "storage account replication type"
    type=string
}
variable "storage_account_kind"{
    description = "storage account kind"
    type=string
}
variable "storage_website_index_document"{
    description = "storage account index document"
    type=string
}
variable "storage_website_error_404_document"{
    description = "storage account error 404 document"
    type=string
}