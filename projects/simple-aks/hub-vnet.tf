# This file defines the hub virtual network and a subnet for shared services.
# The hub VNet acts as the central point for connectivity and shared resources.
resource "azurerm_virtual_network" "hub" {
  name                = "hub-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.aks.name
}

resource "azurerm_subnet" "hub_shared" {
  name                 = "shared-services"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.hub.name
  address_prefixes     = ["10.0.1.0/24"]
}
