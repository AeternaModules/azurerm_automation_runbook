output "automation_runbooks_id" {
  description = "Map of id values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.id if v.id != null && length(v.id) > 0 }
}
output "automation_runbooks_automation_account_name" {
  description = "Map of automation_account_name values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.automation_account_name if v.automation_account_name != null && length(v.automation_account_name) > 0 }
}
output "automation_runbooks_content" {
  description = "Map of content values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.content if v.content != null && length(v.content) > 0 }
}
output "automation_runbooks_description" {
  description = "Map of description values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.description if v.description != null && length(v.description) > 0 }
}
output "automation_runbooks_draft" {
  description = "Map of draft values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.draft if v.draft != null && length(v.draft) > 0 }
}
output "automation_runbooks_job_schedule" {
  description = "Map of job_schedule values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.job_schedule if v.job_schedule != null && length(v.job_schedule) > 0 }
}
output "automation_runbooks_location" {
  description = "Map of location values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.location if v.location != null && length(v.location) > 0 }
}
output "automation_runbooks_log_activity_trace_level" {
  description = "Map of log_activity_trace_level values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.log_activity_trace_level if v.log_activity_trace_level != null }
}
output "automation_runbooks_log_progress" {
  description = "Map of log_progress values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.log_progress if v.log_progress != null }
}
output "automation_runbooks_log_verbose" {
  description = "Map of log_verbose values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.log_verbose if v.log_verbose != null }
}
output "automation_runbooks_name" {
  description = "Map of name values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.name if v.name != null && length(v.name) > 0 }
}
output "automation_runbooks_publish_content_link" {
  description = "Map of publish_content_link values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.publish_content_link if v.publish_content_link != null && length(v.publish_content_link) > 0 }
}
output "automation_runbooks_resource_group_name" {
  description = "Map of resource_group_name values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "automation_runbooks_runbook_type" {
  description = "Map of runbook_type values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.runbook_type if v.runbook_type != null && length(v.runbook_type) > 0 }
}
output "automation_runbooks_runtime_environment_name" {
  description = "Map of runtime_environment_name values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.runtime_environment_name if v.runtime_environment_name != null && length(v.runtime_environment_name) > 0 }
}
output "automation_runbooks_tags" {
  description = "Map of tags values across all automation_runbooks, keyed the same as var.automation_runbooks"
  value       = { for k, v in azurerm_automation_runbook.automation_runbooks : k => v.tags if v.tags != null && length(v.tags) > 0 }
}

