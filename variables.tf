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
      parameters = optional(list(object({
        default_value = optional(string)
        key           = string
        mandatory     = optional(bool) # Default: false
        position      = optional(number)
        type          = string
      })))
    }))
    job_schedule = optional(list(object({
      parameters    = optional(map(string))
      run_on        = optional(string)
      schedule_name = string
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
  # --- Unconfirmed validation candidates, derived from azurerm_automation_runbook's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    validate.RunbookName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: automation_account_name
  #   source:    validate.AutomationAccount: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: runbook_type
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: content
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: job_schedule.schedule_name
  #   source:    validate.ScheduleName: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: job_schedule.parameters
  #   source:    [from validate.ParameterNames] k != strings.ToLower(k)
  # path: draft.output_types[*]
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: draft.parameters.key
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: draft.parameters.type
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: draft.parameters.position
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: draft.parameters.default_value
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: log_activity_trace_level
  #   condition: value >= 0
  #   message:   must be at least 0
  # path: runtime_environment_name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

