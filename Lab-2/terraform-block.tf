#Terraform block
terraform {
  # reffered to cloud vendors or any provide you can have
  required_providers {
    azurerm={
        source ="hashicorp/azurerm",
        version = "~> 2.65"
    }
  }
}
#Provider Block
provider "azurerm" {
  features {
  }
}
#resource block
resource "azurerm_resource_group" "myrg" {
  name="myreg-1"
  location="East US"
}
