# This file defines variables used throughout the Terraform configuration.
# It is needed to make the configuration reusable and parameterized.
variable "resource_group_name" {
  description = "The name of the resource group in which to create resources."
  type        = string
  default     = "rg-aks-test"
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
  default     = "eastus"
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
  default = "aks-test"

}
