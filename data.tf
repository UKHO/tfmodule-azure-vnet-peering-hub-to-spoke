data "azurerm_resource_group" "hub" {
  provider = azurerm.hub
  name     = var.hubrg
}

data "azurerm_resource_group" "spoke" {
  provider = azurerm.spoke
  name     = var.spokerg
}

data "azurerm_virtual_network" "hubvnet" {
provider                       = azurerm.hub
name                           = var.hubvnet
resource_group_name            = data.azurerm_resource_group.hub.name
}

data "azurerm_virtual_network" "spokevnet" {
  provider                     = azurerm.spoke
  name                         = var.spokevnet
  resource_group_name          = data.azurerm_resource_group.spoke.name
}