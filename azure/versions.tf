terraform {
  required_version = ">= 1.5.0"
  backend "remote" {
    organization = "example-org"
    workspaces {
      name = "secure-multicloud"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}
