# avm (azure verified modules)

## Objective

- Objective is used to use azure verified modules to provision resources via terraform

## export the variables for eg uaenorth

export TF_VAR_location="uaenorth"

## Add the subscription_id to terraform.tf

```bash
provider "azurerm" {
  subscription_id="<sub-id>"
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false # This is to handle MCAPS or other policy driven resource creation.
    }
  }
  resource_provider_registrations = "extended"
  storage_use_azuread             = true
}
```

## How to point to the verified modules

- Go to the site <https://azure.github.io/Azure-Verified-Modules/indexes/terraform/tf-resource-modules/>
- Click on module name for Published modules - it will navigate to terraform website
- In terraform  website Verify it displays as Partner
- Select the required version
- Click on the Source code to navigate to Github (if needed)

## How to create new resources

- Go to the site <https://azure.github.io/Azure-Verified-Modules/indexes/terraform/tf-resource-modules/>
- Click on module name for Published modules - it will navigate to terraform website
- Select default/required configuration based on the requirement
- create the file and add the required modules
- P.S: Source names can be found at Provision Instructions

## How to download modules

- Go to the site <https://azure.github.io/Azure-Verified-Modules/indexes/terraform/tf-resource-modules/>
- Click on module name for Published modules - it will navigate to terraform website
- Click on Source code - which will redirect to github page
- clone the repo
- P.S: Try to use modules with versioning to avoid breakable changes

## How to see different versions of a module

- Go to the site <https://azure.github.io/Azure-Verified-Modules/indexes/terraform/tf-resource-modules/>
- Click on module name for Published modules - it will navigate to terraform website
- Click on Source code - which will redirect to github page
- Click on tags to see versions
  
## How to modify the avm files

- Parameterize the variables in variable.tf or modify directly if it consistent with environments
- Make a note in readme.md for each change as it requires to use for each change in version

## resources created

- ✅ Virtual network
- ✅ Subnets
- ✅ Network security groups
- ✅ Virtual machines
- ✅ Azure Bastion Host
- ✅ Managed identities
- ✅ Key Vault
- ✅ Storage account with customer managed key
- ✅ Private end points and associated private DNS zones
- ✅ container registry with private endpoint
- 🚀 Successfully able to create resources

## Reference

- <https://azure.github.io/Azure-Verified-Modules/> # verified modules
- <https://learn.microsoft.com/en-us/samples/azure-samples/avm-terraform-labs/avm-terraform-labs/> # sample terraform labs
- <https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-naming> # naming conventions

## avm modules

- keyvault
- bastion
- virtual machine
- storage account
- acr