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
 - To run in CI, set ARM_CLIENT_ID, ARM_CLIENT_SECRET, ARM_SUBSCRIPTION_ID, ARM_TENANT_ID env vars.
 - Change `resource_group_name` to the actual RG containing `terraformstatefllabs` if needed.
*/

