locals {
  management_resource_group_name          = "rg-management-${var.location}"
  management_resource_group_id            = "/subscriptions/${var.subscription_ids["management"]}/resourcegroups/${local.management_resource_group_name}"
  automation_account_name                 = "aa-management-${var.location}"
  log_analytics_workspace_name            = "law-management-${var.location}"
  ama_user_assigned_managed_identity_name = "uami-management-ama-${var.location}"
  dcr_change_tracking_name                = "dcr-change-tracking"
  dcr_defender_sql_name                   = "dcr-defender-sql"
  dcr_vm_insights_name                    = "dcr-vm-insights"

  ama_user_assigned_managed_identity_id       = "${local.management_resource_group_id}/providers/Microsoft.ManagedIdentity/userAssignedIdentities/${local.ama_user_assigned_managed_identity_name}"
  ama_change_tracking_data_collection_rule_id = "${local.management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/${local.dcr_change_tracking_name}"
  ama_mdfc_sql_data_collection_rule_id        = "${local.management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/${local.dcr_defender_sql_name}"
  ama_vm_insights_data_collection_rule_id     = "${local.management_resource_group_id}/providers/Microsoft.Insights/dataCollectionRules/${local.dcr_vm_insights_name}"
  log_analytics_workspace_id                  = "${local.management_resource_group_id}/providers/Microsoft.OperationalInsights/workspaces/${local.log_analytics_workspace_name}"

  default_retries = {
    management_groups = {
      error_message_regex = ["AuthorizationFailed", "Permission to Microsoft.Management/managementGroups on resources of type 'Write' is required on the management group or its ancestors."]
    }
    role_definitions = {
      error_message_regex = ["AuthorizationFailed"]
    }
    policy_definitions = {
      error_message_regex = ["AuthorizationFailed"]
    }
    policy_set_definitions = {
      error_message_regex = ["AuthorizationFailed"]
    }
    policy_assignments = {
      error_message_regex = ["AuthorizationFailed", "The policy definition specified in policy assignment '.+' is out of scope"]
    }
    policy_role_assignments = {
      error_message_regex = ["AuthorizationFailed", "ResourceNotFound", "RoleAssignmentNotFound"]
    }
    hierarchy_settings = {
      error_message_regex = ["AuthorizationFailed"]
    }
    subscription_placement = {
      error_message_regex = ["AuthorizationFailed"]
    }
  }

  default_timeouts = {
    management_group = {
      create = "60m"
      read   = "60m"
    }
    role_definition = {
      create = "60m"
      read   = "60m"
    }
    policy_assignment = {
      create = "60m"
      read   = "60m"
    }
    policy_definition = {
      create = "60m"
      read   = "60m"
    }
    policy_set_definition = {
      create = "60m"
      read   = "60m"
    }
    policy_role_assignment = {
      create = "60m"
      read   = "60m"
    }
  }
}