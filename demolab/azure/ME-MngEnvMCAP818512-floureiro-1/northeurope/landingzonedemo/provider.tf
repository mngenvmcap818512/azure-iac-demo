provider "azurerm" {
  features {}
  resource_provider_registrations = "none"
  use_msi = true
  msi_endpoint = "http://169.254.169.254/metadata/identity/oauth2/token"
}