# Terraform Module: Azure vnet peering hub to spoke

## Use

```terraform
module "peering" {
  source = "github.com/ukho/tfmodule-azure-vnet-peering-hub-to-spoke?ref=x.y.z"
  hubsubscription = "[hub_subscription_id]"
  spokesubscription = "${var.SubscriptionId}"
  hubrg = "[hub-rgname]"
  spokerg = "[spoke-rgname]"
  hubvnet = "[hubvnetnmame]"
  spokevnet = "${var.ProjectIdentity}-vnet"
  peer1to2 = "peering-[hub-vnetname]-to-${var.ProjectIdentity}-vnet"
  peer2to1 = "peering-${var.ProjectIdentity}-vnet-to-[hub-vnetname]"
}
```
