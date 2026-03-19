/* Terraform backend for storing state in Azure Blob Storage.
	 Uses the currently logged-in `az login` user for authentication.
	 Update `resource_group_name` if the storage account is in a different resource group. */

terraform {
	backend "azurerm" {
		use_oidc             = true
		resource_group_name  = "terraform-demo"
		# Optional: specify subscription where the storage account lives
		# Replace with your subscription id, or remove to use the currently
		# logged-in subscription from `az login`.
		subscription_id      = "87eaa642-2093-423d-8360-47bf745c874c"
		storage_account_name = "satfiacdemo"
		container_name       = "tfstate"
		key                  = "demolab/azure/ME-MngEnvMCAP818512-floureiro-1/northeurope/landingzonedemo/terraform.tfstate"
	}
}

/* Notes:
 - Authenticate locally with `az login` before running `terraform init`.
 - For OIDC to work with managed identity, ensure:
   1. You are logged in with the correct Azure account: az account show
   2. The storage account allows your managed identity access
   3. Consider setting explicit env vars if needed:
      ARM_CLIENT_ID (managed identity client ID)
      ARM_SUBSCRIPTION_ID (already in config above)
      ARM_TENANT_ID
      ARM_USE_OIDC=true
 - In CI/CD: Set ARM_CLIENT_ID, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID, ARM_USE_OIDC=true env vars
*/

