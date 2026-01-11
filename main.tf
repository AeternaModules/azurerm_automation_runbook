resource "azurerm_automation_runbook" "automation_runbooks" {
  for_each = var.automation_runbooks

  automation_account_name  = each.value.automation_account_name
  location                 = each.value.location
  log_progress             = each.value.log_progress
  log_verbose              = each.value.log_verbose
  name                     = each.value.name
  resource_group_name      = each.value.resource_group_name
  runbook_type             = each.value.runbook_type
  content                  = each.value.content
  description              = each.value.description
  log_activity_trace_level = each.value.log_activity_trace_level
  tags                     = each.value.tags

  dynamic "draft" {
    for_each = each.value.draft != null ? [each.value.draft] : []
    content {
      dynamic "content_link" {
        for_each = draft.value.content_link != null ? [draft.value.content_link] : []
        content {
          dynamic "hash" {
            for_each = content_link.value.hash != null ? [content_link.value.hash] : []
            content {
              algorithm = hash.value.algorithm
              value     = hash.value.value
            }
          }
          uri     = content_link.value.uri
          version = content_link.value.version
        }
      }
      edit_mode_enabled = draft.value.edit_mode_enabled
      output_types      = draft.value.output_types
      dynamic "parameters" {
        for_each = draft.value.parameters != null ? [draft.value.parameters] : []
        content {
          default_value = parameters.value.default_value
          key           = parameters.value.key
          mandatory     = parameters.value.mandatory
          position      = parameters.value.position
          type          = parameters.value.type
        }
      }
    }
  }

  dynamic "job_schedule" {
    for_each = each.value.job_schedule != null ? [each.value.job_schedule] : []
    content {
      parameters    = job_schedule.value.parameters
      run_on        = job_schedule.value.run_on
      schedule_name = job_schedule.value.schedule_name
    }
  }

  dynamic "publish_content_link" {
    for_each = each.value.publish_content_link != null ? [each.value.publish_content_link] : []
    content {
      dynamic "hash" {
        for_each = publish_content_link.value.hash != null ? [publish_content_link.value.hash] : []
        content {
          algorithm = hash.value.algorithm
          value     = hash.value.value
        }
      }
      uri     = publish_content_link.value.uri
      version = publish_content_link.value.version
    }
  }
}

