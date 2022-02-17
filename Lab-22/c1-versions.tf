terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm",
      version = "~> 2.65"
    }
    null = {
      source  = "hashicorp/null",
      version = "~> 3.0"
    }
    time = {
      source  = "hashicorp/time",
      version = "~> 0.7.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}
provider "azurerm" {
  features {
  }
}

resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
  number  = false
}

