output "automation_runbooks_automation_account_name" {
  description = "Map of automation_account_name values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.automation_account_name }
}
output "automation_runbooks_content" {
  description = "Map of content values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.content }
}
output "automation_runbooks_description" {
  description = "Map of description values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.description }
}
output "automation_runbooks_draft" {
  description = "Map of draft values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.draft }
}
output "automation_runbooks_job_schedule" {
  description = "Map of job_schedule values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.job_schedule }
}
output "automation_runbooks_location" {
  description = "Map of location values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.location }
}
output "automation_runbooks_log_activity_trace_level" {
  description = "Map of log_activity_trace_level values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.log_activity_trace_level }
}
output "automation_runbooks_log_progress" {
  description = "Map of log_progress values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.log_progress }
}
output "automation_runbooks_log_verbose" {
  description = "Map of log_verbose values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.log_verbose }
}
output "automation_runbooks_name" {
  description = "Map of name values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.name }
}
output "automation_runbooks_publish_content_link" {
  description = "Map of publish_content_link values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.publish_content_link }
}
output "automation_runbooks_resource_group_name" {
  description = "Map of resource_group_name values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.resource_group_name }
}
output "automation_runbooks_runbook_type" {
  description = "Map of runbook_type values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.runbook_type }
}
output "automation_runbooks_runtime_environment_name" {
  description = "Map of runtime_environment_name values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.runtime_environment_name }
}
output "automation_runbooks_tags" {
  description = "Map of tags values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.tags }
}

