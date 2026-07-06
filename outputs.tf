output "automation_runbooks" {
  description = "All automation_runbook resources"
  value       = azurerm_automation_runbook.automation_runbooks
}
output "automation_runbooks_automation_account_name" {
  description = "List of automation_account_name values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.automation_account_name]
}
output "automation_runbooks_content" {
  description = "List of content values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.content]
}
output "automation_runbooks_description" {
  description = "List of description values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.description]
}
output "automation_runbooks_draft" {
  description = "List of draft values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.draft]
}
output "automation_runbooks_job_schedule" {
  description = "List of job_schedule values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.job_schedule]
}
output "automation_runbooks_location" {
  description = "List of location values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.location]
}
output "automation_runbooks_log_activity_trace_level" {
  description = "List of log_activity_trace_level values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.log_activity_trace_level]
}
output "automation_runbooks_log_progress" {
  description = "List of log_progress values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.log_progress]
}
output "automation_runbooks_log_verbose" {
  description = "List of log_verbose values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.log_verbose]
}
output "automation_runbooks_name" {
  description = "List of name values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.name]
}
output "automation_runbooks_publish_content_link" {
  description = "List of publish_content_link values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.publish_content_link]
}
output "automation_runbooks_resource_group_name" {
  description = "List of resource_group_name values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.resource_group_name]
}
output "automation_runbooks_runbook_type" {
  description = "List of runbook_type values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.runbook_type]
}
output "automation_runbooks_runtime_environment_name" {
  description = "List of runtime_environment_name values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.runtime_environment_name]
}
output "automation_runbooks_tags" {
  description = "List of tags values across all automation_runbooks"
  value       = [for k, v in azurerm_automation_runbook.automation_runbooks : v.tags]
}

