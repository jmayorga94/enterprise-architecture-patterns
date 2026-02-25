# This file defines the Azure Kubernetes Service (AKS) cluster resource.
# It is needed to actually provision the managed Kubernetes cluster in Azure.
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "${var.aks_cluster_name}-dns"
  sku_tier = "Standard"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_DS2_v2"
    vnet_subnet_id = azurerm_subnet.aks.id # Use the spoke subnet for AKS nodes
  }

  network_profile {
    network_plugin    = "azure" # Enables advanced networking (CNI)
    network_policy    = "azure"
    dns_service_ip    = "10.2.0.10"
    service_cidr      = "10.2.0.0/16"
  }
  
  automatic_upgrade_channel = "stable"
  cost_analysis_enabled = true
  identity {
    type = "SystemAssigned"
  }
}
resource "azurerm_kubernetes_cluster_node_pool" "apps" {
  name                  = "apps"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_DS2_v2"
  node_count            = 2
  vnet_subnet_id        = azurerm_subnet.aks.id
  mode                  = "User" # "User" for app workloads, "System" for system pods
  node_labels = {
    "role" = "apps"
  }
}