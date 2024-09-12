provider "azurerm" {
  features {}
  subscription_id = "2ef01a24-f9c4-4a9f-bca8-7d0ca8fe11fa"
}

resource "azurerm_resource_group" "stgex" {
  name     = "rg-auea-dev-gh-ws"
  location = "Australia East"
}

resource "azurerm_storage_account" "example" {
  name                     = "stgaueadevghws"
  resource_group_name      = azurerm_resource_group.stgex.name
  location                 = azurerm_resource_group.stgex.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
