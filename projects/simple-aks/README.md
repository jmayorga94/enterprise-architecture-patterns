# Simple AKS Hub-and-Spoke Terraform Project

## Overview
This project provisions a simple Azure Kubernetes Service (AKS) cluster using Terraform, following a hub-and-spoke network architecture. The configuration is modular and production-oriented, providing a secure and scalable foundation for containerized workloads in Azure.

## AKS Configuration
- **AKS Cluster**: Deployed in a spoke virtual network (VNet) with advanced Azure CNI networking.
- **Node Pool**: Single default node pool, 1 node, Standard_DS2_v2 VM size (modifiable).
- **Managed Identity**: System-assigned managed identity enabled for secure access to Azure resources.
- **Network Profile**: Azure CNI, Azure network policy, custom DNS and service CIDR.
- **Automatic Upgrades**: Enabled on the stable channel for cluster reliability.
- **Cost Analysis**: Enabled for monitoring and optimizing cluster costs.
- **SKU Tier**: Standard (for production-grade features).

## Architecture Characteristics
- **Hub-and-Spoke Topology**: 
  - **Hub VNet**: Centralized network for shared services and connectivity (e.g., VPN, firewalls).
  - **Spoke VNet**: Isolated network for AKS cluster nodes, peered to the hub for secure communication.
  - **VNet Peering**: Bidirectional peering between hub and spoke for controlled, private traffic flow.
- **Security**: Network isolation between workloads, centralized control of shared services, and managed identity for secure resource access.
- **Scalability**: Easily add more spokes for additional workloads or environments.
- **Modularity**: Separate Terraform files for providers, variables, networking, AKS, and outputs for maintainability.

## Usage
1. Authenticate to Azure (e.g., `az login`).
2. Initialize Terraform:
   ```sh
   terraform init
   ```
3. Plan the deployment:
   ```sh
   terraform plan
   ```
4. Apply the configuration:
   ```sh
   terraform apply
   ```
5. Provide required variables (resource group name, AKS cluster name) if prompted.

## Files
- `providers.tf`: Provider and backend configuration.
- `variables.tf`: Input variables for customization.
- `resource-group.tf`: Resource group definition.
- `hub-vnet.tf`: Hub VNet and subnet.
- `spoke-vnet-aks.tf`: Spoke VNet and AKS subnet.
- `peering.tf`: VNet peering setup.
- `aks.tf` or `main.tf`: AKS cluster resource.
- `outputs.tf`: Useful outputs (e.g., kubeconfig).

## Notes
- This setup is a starting point for production-grade AKS deployments.
- You can extend the architecture with more spokes, shared services, or security controls as needed.
- Review and adjust node pool, network, and security settings for your requirements.
