resource "google_scc_management_folder_security_health_analytics_custom_module" "scc_management_folder_security_health_analytics_custom_modules" {
  for_each = var.scc_management_folder_security_health_analytics_custom_modules

  folder           = each.value.folder
  deletion_policy  = each.value.deletion_policy
  display_name     = each.value.display_name
  enablement_state = each.value.enablement_state
  location         = each.value.location

  dynamic "custom_config" {
    for_each = each.value.custom_config != null ? [each.value.custom_config] : []
    content {
      dynamic "custom_output" {
        for_each = custom_config.value.custom_output != null ? [custom_config.value.custom_output] : []
        content {
          dynamic "properties" {
            for_each = custom_output.value.properties != null ? custom_output.value.properties : []
            content {
              name = properties.value.name
              dynamic "value_expression" {
                for_each = properties.value.value_expression != null ? [properties.value.value_expression] : []
                content {
                  description = value_expression.value.description
                  expression  = value_expression.value.expression
                  location    = value_expression.value.location
                  title       = value_expression.value.title
                }
              }
            }
          }
        }
      }
      description = custom_config.value.description
      dynamic "predicate" {
        for_each = custom_config.value.predicate != null ? [custom_config.value.predicate] : []
        content {
          description = predicate.value.description
          expression  = predicate.value.expression
          location    = predicate.value.location
          title       = predicate.value.title
        }
      }
      recommendation = custom_config.value.recommendation
      dynamic "resource_selector" {
        for_each = custom_config.value.resource_selector != null ? [custom_config.value.resource_selector] : []
        content {
          resource_types = resource_selector.value.resource_types
        }
      }
      severity = custom_config.value.severity
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

