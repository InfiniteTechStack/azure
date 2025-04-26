module "containerregistry" {
  source = "Azure/avm-res-containerregistry-registry/azurerm"
  version = "0.4.0"

  name                          = local.resource_names.acr_name
  location                      = var.location
  resource_group_name           = module.resource_group.name
  public_network_access_enabled = false
  zone_redundancy_enabled       = false

  private_endpoints = {
    primary = {
      private_dns_zone_resource_ids = [module.private_dns_zone_acr.resource_id]
      subnet_resource_id            = module.virtual_network.subnets["private_endpoints"].resource_id
      subresource_name              = ["acr"]
      tags                          = var.tags
    }
  }
  depends_on = [
    module.private_dns_zone_acr
  ]

}

module "private_dns_zone_acr" {
  source  = "Azure/avm-res-network-privatednszone/azurerm"
  version = "0.3.2"

  resource_group_name = module.resource_group.name
  domain_name         = "privatelink.azurecr.io"
  virtual_network_links = {
    vnetlink1 = {
      vnetlinkname = "acr"
      vnetid       = module.virtual_network.resource_id
    }
  }

  tags = var.tags
}

