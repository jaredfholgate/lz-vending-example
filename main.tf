data "azurerm_client_config" "this" {}

module "lz-vending" {
  source  = "Azure/lz-vending/azurerm"
  version = "4.1.5"

  location                               = var.location
  network_watcher_resource_group_enabled = true
  resource_group_creation_enabled        = true
  resource_groups                        = var.resource_groups

  subscription_use_azapi     = true
  subscription_display_name  = var.subscription_name
  subscription_tags          = var.subscription_tags
  subscription_billing_scope = "/providers/Microsoft.Billing/billingAccounts/${var.billingAccountName}/enrollmentAccounts/${var.enrollmentAccountName}"
  subscription_workload      = "Production"
  subscription_alias_enabled = true
  subscription_alias_name    = var.subscription_name

  subscription_management_group_association_enabled = true
  subscription_management_group_id                  = var.management_group_name

  role_assignment_enabled = true
  role_assignments = merge({
    planner = {
      principal_id = var.plan_identity_object_id
      definition   = "Reader"
    }
    }, { for key, value in var.subscription_owners : "owner-${key}" => {
      principal_id = value
      definition   = "Owner"
    }
  })

  virtual_network_enabled = true
  virtual_networks = { for key, value in var.virtual_networks : key => {
    name                = value.name
    address_space       = value.address_space
    resource_group_name = "rg-spoke-${var.subscription_name}"

    location = var.location

    ddos_protection_enabled = true
    ddos_protection_plan_id = var.ddos_protection_plan_id

    hub_peering_enabled     = true
    hub_network_resource_id = var.hub_network_resource_id
  } }
}


