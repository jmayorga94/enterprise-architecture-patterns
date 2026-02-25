# This file defines the Azure resource group required for the AKS cluster.
# It is needed because all Azure resources must be placed in a resource group.
resource "azurerm_resource_group" "aks" {
  name     = var.resource_group_name
  location = var.location
}
