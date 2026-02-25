# This file defines the required Terraform provider and backend configuration.
# It is needed to specify which cloud provider (Azure) and how Terraform stores state.
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.0.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
}
