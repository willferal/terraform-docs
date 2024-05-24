terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  location = "westus2"
  name     = var.resource_group_name

  tags = {
    Environment = "Terraform getting started"
    Team = "DevOps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  name                = "myVNET"
  resource_group_name = azurerm_resource_group.rg.name
}

/*
Next steps:
  - authenticate with azure CLI
  - Terraform init: to initialize the project
  - terraform fmt: to formatting the files of project
  - terraform validate: to verify if the structure of the files are valid
  - terraform apply: to apply de changes set in the terraform files
  - terraform show: to see all the values and attributes of the vm
  - terraform destroy: to destroy all the resources of the vm

*/