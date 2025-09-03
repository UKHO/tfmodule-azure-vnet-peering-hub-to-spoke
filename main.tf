resource "azurerm_virtual_network_peering" "vnet_peer_1" {
  provider                     = azurerm.hub
  name                         = var.peer1to2
  resource_group_name          = data.azurerm_resource_group.hub.name
  virtual_network_name         = data.azurerm_virtual_network.hubvnet.name
  remote_virtual_network_id    = data.azurerm_virtual_network.spokevnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = true
  use_remote_gateways          = false

  lifecycle {
    ignore_changes = [remote_virtual_network_id]
  }
}

resource "azurerm_virtual_network_peering" "vnet_peer_2" {
  provider                     = azurerm.spoke
  name                         = var.peer2to1
  resource_group_name          = data.azurerm_resource_group.spoke.name
  virtual_network_name         = data.azurerm_virtual_network.spokevnet.name
  remote_virtual_network_id    = data.azurerm_virtual_network.hubvnet.id
  allow_virtual_network_access = true
  allow_forwarded_traffic      = true
  allow_gateway_transit        = false
  use_remote_gateways          = true

    lifecycle {
    ignore_changes = [remote_virtual_network_id]
  }
}




