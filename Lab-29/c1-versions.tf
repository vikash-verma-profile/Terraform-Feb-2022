terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    azurerm = {
      source  = "hashicorp/azurerm",
      version = "2.6.0"
    }
  }
}

provider "azurerm" {
  features {
  }
  location="westus"
}
provider "azurerm" {
  features {
  }
   alias = "eastus"
   subscription_id = ""
}
#alias
provider "aws" {
  region  = "us-east-1"
  profile = "default"
}
provider "aws" {
  alias  = "east2"
  region = "us-east-2"
}



