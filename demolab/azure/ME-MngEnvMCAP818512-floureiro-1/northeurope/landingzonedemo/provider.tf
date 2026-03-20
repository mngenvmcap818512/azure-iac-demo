provider "azurerm" {
  features {}
  subscription_id = "87eaa642-2093-423d-8360-47bf745c874c"
}

data "azurerm_client_config" "current" {}