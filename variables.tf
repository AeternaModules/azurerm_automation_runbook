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
        - parameters (optional)
        - run_on (optional)
        - schedule_name (required)
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
      parameters = optional(object({
        default_value = optional(string)
        key           = string
        mandatory     = optional(bool) # Default: false
        position      = optional(number)
        type          = string
      }))
    }))
    job_schedule = optional(object({
      parameters    = optional(map(string))
      run_on        = optional(string)
      schedule_name = string
    }))
    publish_content_link = optional(object({
      hash = optional(object({
        algorithm = string
        value     = string
      }))
      uri     = string
      version = optional(string)
    }))
  }))
}

