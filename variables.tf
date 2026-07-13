variable "automation_runbooks" {
  description = <<EOT
Map of automation_runbooks, attributes below
Required:
    - automation_account_name
    - location
    - log_progress
    - log_verbose
    - name
    - resource_group_name
    - runbook_type
Optional:
    - content
    - description
    - log_activity_trace_level
    - runtime_environment_name
    - tags
    - draft (block):
        - content_link (optional, block):
            - hash (optional, block):
                - algorithm (required)
                - value (required)
            - uri (required)
            - version (optional)
        - edit_mode_enabled (optional)
        - output_types (optional)
        - parameters (optional, block):
            - default_value (optional)
            - key (required)
            - mandatory (optional)
            - position (optional)
            - type (required)
    - job_schedule (block):
        - job_schedule_id (optional)
        - parameters (optional)
        - run_on (optional)
        - schedule_name (optional)
    - publish_content_link (block):
        - hash (optional, block):
            - algorithm (required)
            - value (required)
        - uri (required)
        - version (optional)
EOT

  type = map(object({
    automation_account_name  = string
    location                 = string
    log_progress             = bool
    log_verbose              = bool
    name                     = string
    resource_group_name      = string
    runbook_type             = string
    content                  = optional(string)
    description              = optional(string)
    log_activity_trace_level = optional(number)
    runtime_environment_name = optional(string)
    tags                     = optional(map(string))
    draft = optional(object({
      content_link = optional(object({
        hash = optional(object({
          algorithm = string
          value     = string
        }))
        uri     = string
        version = optional(string)
      }))
      edit_mode_enabled = optional(bool)
      output_types      = optional(list(string))
      parameters = optional(list(object({
        default_value = optional(string)
        key           = string
        mandatory     = optional(bool)
        position      = optional(number)
        type          = string
      })))
    }))
    job_schedule = optional(list(object({
      job_schedule_id = optional(string)
      parameters      = optional(map(string))
      run_on          = optional(string)
      schedule_name   = optional(string)
    })))
    publish_content_link = optional(object({
      hash = optional(object({
        algorithm = string
        value     = string
      }))
      uri     = string
      version = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.content == null || (length(v.content) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.draft == null || (v.draft.output_types == null || (alltrue([for x in v.draft.output_types : length(x) > 0])))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.draft == null || (v.draft.parameters == null || alltrue([for item in v.draft.parameters : (length(item.key) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.draft == null || (v.draft.parameters == null || alltrue([for item in v.draft.parameters : (length(item.type) > 0)]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.draft == null || (v.draft.parameters == null || alltrue([for item in v.draft.parameters : (item.position == null || (item.position >= 0))]))
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.draft == null || (v.draft.parameters == null || alltrue([for item in v.draft.parameters : (item.default_value == null || (length(item.default_value) > 0))]))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.log_activity_trace_level == null || (v.log_activity_trace_level >= 0)
      )
    ])
    error_message = "must be at least 0"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.runtime_environment_name == null || (length(v.runtime_environment_name) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.automation_runbooks : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

