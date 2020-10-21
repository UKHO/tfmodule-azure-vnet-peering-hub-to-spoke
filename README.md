# Terraform Module: Azure vnet peering hub to spoke

## Use

```terraform
module "peering" {
  source                      = "github.com/ukho/tfmodule-azure-vnet-peering-hub-to-spoke?ref=0.2.0"
  providers = {
        azurerm.hub   = azurerm.hub
        azurerm.spoke = azurerm.spoke
}
  hubrg                       = "UKHO-VPN-RG"
  spokerg                     =  azurerm_resource_group.rg.name
  hubvnet                     = "UKHO-VPN-vnet"
  spokevnet                   = "${var.ProjectIdentity}-vnet"
  peer1to2                    = "peering-UKHO-VPN-vnet-to-${var.ProjectIdentity}-vnet"
  peer2to1                    = "peering-${var.ProjectIdentity}-vnet-to-UKHO-VPN-vnet"
}
```
