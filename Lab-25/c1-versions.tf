terraform {
  required_providers {
    azurerm={
        source ="hashicorp/azurerm",
        version = "2.6.0"
    }
  }
}
provider "azurerm" {
  features {
  }
}

