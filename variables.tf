variable "subscription_name" {
  description = "The name of the subscription"
  type        = string
}

variable "management_group_name" {
  description = "The name of the management group"
  type        = string
}

variable "location" {
  description = "The Azure region where resources will be deployed."
  type        = string
}

variable "resource_groups" {
  description = "A map of resource groups to be created."
  type        = map(any)
}

variable "subscription_tags" {
  description = "Tags to be applied to the subscription."
  type        = map(string)
}

variable "billingAccountName" {
  description = "The name of the billing account."
  type        = string
  default     = "7690848"
}

variable "enrollmentAccountName" {
  description = "The name of the enrollment account."
  type        = string
  default     = "385659"
}

variable "virtual_networks" {
  description = "A map of virtual network configurations"
  type = map(object({
    name          = string
    address_space = list(string)
  }))
}

variable "ddos_protection_plan_id" {
  description = "The ID of the DDoS protection plan."
  type        = string
  default     = "/subscriptions/73f401e2-8228-42ca-93e7-9e61cd20cb3b/resourceGroups/rg-hub-ddos-uksouth/providers/Microsoft.Network/ddosProtectionPlans/ddos-uksouth"
}

variable "hub_network_resource_id" {
  description = "The resource ID of the hub network."
  type        = string
  default     = "/subscriptions/73f401e2-8228-42ca-93e7-9e61cd20cb3b/resourceGroups/rg-hub-uksouth/providers/Microsoft.Network/virtualNetworks/vnet-hub-uksouth"
}

variable "plan_identity_object_id" {
  description = "The object ID of the plan identity."
  type        = string
  default     = "371f1cfe-bc95-430b-87c7-46969bbacdf4"
}

variable "subscription_owners" {
  description = "A list of owners for the subscription."
  type        = map(string)
  default = {
    admin = "b1b120bb-1494-4dc3-a7f2-8387b8df7857"
  }
}