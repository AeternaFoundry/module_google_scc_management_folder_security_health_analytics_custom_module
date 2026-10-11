variable "scc_management_folder_security_health_analytics_custom_modules" {
  description = <<EOT
Map of scc_management_folder_security_health_analytics_custom_modules, attributes below
Required:
    - folder
Optional:
    - deletion_policy
    - display_name
    - enablement_state
    - location
    - custom_config (block):
        - custom_output (optional, block):
            - properties (optional, block):
                - name (optional)
                - value_expression (optional, block):
                    - description (optional)
                    - expression (required)
                    - location (optional)
                    - title (optional)
        - description (optional)
        - predicate (optional, block):
            - description (optional)
            - expression (required)
            - location (optional)
            - title (optional)
        - recommendation (optional)
        - resource_selector (optional, block):
            - resource_types (required)
        - severity (optional)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - update (optional)
EOT

  type = map(object({
    folder           = string
    deletion_policy  = optional(string)
    display_name     = optional(string)
    enablement_state = optional(string)
    location         = optional(string)
    custom_config = optional(object({
      custom_output = optional(object({
        properties = optional(list(object({
          name = optional(string)
          value_expression = optional(object({
            description = optional(string)
            expression  = string
            location    = optional(string)
            title       = optional(string)
          }))
        })))
      }))
      description = optional(string)
      predicate = optional(object({
        description = optional(string)
        expression  = string
        location    = optional(string)
        title       = optional(string)
      }))
      recommendation = optional(string)
      resource_selector = optional(object({
        resource_types = list(string)
      }))
      severity = optional(string)
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      update = optional(string)
    }))
  }))
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

