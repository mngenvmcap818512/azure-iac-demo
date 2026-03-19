/* Terraform backend for storing state in Azure Blob Storage.
	 Uses the currently logged-in `az login` user for authentication.
	 Update `resource_group_name` if the storage account is in a different resource group. */

terraform {
	backend "azurerm" {
		//use_oidc             = true
		//client_id            = "4fbfaeab-aea9-4f8c-9dc8-daed7be87f8b"  # Set via ARM_CLIENT_ID env var in CI/CD
		resource_group_name  = "terraform-demo"
		subscription_id      = "87eaa642-2093-423d-8360-47bf745c874c"
		storage_account_name = "satfiacdemo"
		container_name       = "tfstate"
		key                  = "demolab/azure/ME-MngEnvMCAP818512-floureiro-1/northeurope/landingzonedemo/terraform.tfstate"
	}
}

/* Notes:
 - Local: Authenticate with `az login` before running `terraform init`
 - CI/CD: Requires these environment variables:
   - ARM_CLIENT_ID (managed identity client ID)
   - ARM_SUBSCRIPTION_ID
   - ARM_TENANT_ID
   - ARM_USE_OIDC=true
 - The storage account must allow access from your managed identity
*/

