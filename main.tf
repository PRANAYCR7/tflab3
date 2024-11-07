terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
#  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}

subscription_id      = "d5093934-1a30-426e-acb0-c14331a9b7fa"
client_id            = "81316734-1a33-4d3a-95ff-4254d9f8af62"
client_secret        = "aw18Q~JRQoyVHAWJgKNDS0bQEh2ENfCI.NU4XcGe"
tenant_id            = "7974832e-4b9b-49e6-bc93-b5695f510220"
}


resource "azurerm_resource_group" "newrg" {
  name     = join("",["${var.prefix}"],["RG01"])
  location = "australiaeast"
}

resource "azurerm_storage_account" "newsa" {
  name                     = lower(join("",["$var.prefix"],["RG01"]))
  resource_group_name      = azurerm_resource_group.newrg.name
  location                 = azurerm_resource_group.newrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

output "rgname" {
   value = join("",["$var.prefix"],["RG01"])
}
output "saname" {
   value = lower(join("",["$var.prefix"],["RG01"]))
}
