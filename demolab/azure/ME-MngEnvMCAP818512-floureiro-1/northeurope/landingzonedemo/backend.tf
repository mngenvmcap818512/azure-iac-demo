/* Terraform backend for storing state in Azure Blob Storage.
	 Uses the currently logged-in `az login` user for authentication.
	 Update `resource_group_name` if the storage account is in a different resource group. */

terraform {
	backend "azurerm" {
		resource_group_name  = "terraform-demo"
		subscription_id      = "87eaa642-2093-423d-8360-47bf745c874c"
		storage_account_name = "satfiacdemo"
		container_name       = "tfstate"
		key                  = "demolab/azure/ME-MngEnvMCAP818512-floureiro-1/northeurope/landingzonedemo/terraform.tfstate"
		use_azuread_auth     = true
	}
}

/* Notes:
 - Local: `az login` before terraform init (uses Azure CLI token)
 - CI/CD: Use OIDC via GitHub Actions with managed identity
*/

