terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "lab2rg"
    storage_account_name = "adistorage"
    container_name       = "adi-container"
    key                  = "adit-jenkins-demo.tfstate"
  }
}

provider "azurerm" {
  features {}
   subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
}

resource "azurerm_resource_group" "rg" {
  name     = "aditya-JenkinsTerraformRG"
  location = "West US"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "lab2-JenkinsVNet"
  address_space       = ["10.10.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}