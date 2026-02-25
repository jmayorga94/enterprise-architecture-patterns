# This file defines the spoke virtual network and subnet for the AKS cluster.
# The spoke VNet is where the AKS cluster nodes will be deployed.
resource "azurerm_virtual_network" "spoke_aks" {
  name                = "spoke-aks-vnet"
  address_space       = ["10.1.0.0/16"]
  location            = var.location
  resource_group_name = azurerm_resource_group.aks.name
}

resource "azurerm_subnet" "aks" {
  name                 = "aks-subnet"
  resource_group_name  = azurerm_resource_group.aks.name
  virtual_network_name = azurerm_virtual_network.spoke_aks.name
  address_prefixes     = ["10.1.1.0/24"]
}
