variable "hpc_cache_nfs_targets" {
  description = <<EOT
Map of hpc_cache_nfs_targets, attributes below
Required:
    - cache_name
    - name
    - resource_group_name
    - target_host_name
    - usage_model
    - namespace_junction (block):
        - access_policy_name (optional)
        - namespace_path (required)
        - nfs_export (required)
        - target_path (optional)
Optional:
    - verification_timer_in_seconds
    - write_back_timer_in_seconds
EOT

  type = map(object({
    cache_name                    = string
    name                          = string
    resource_group_name           = string
    target_host_name              = string
    usage_model                   = string
    verification_timer_in_seconds = optional(number)
    write_back_timer_in_seconds   = optional(number)
    namespace_junction = list(object({
      access_policy_name = optional(string, "default")
      namespace_path     = string
      nfs_export         = string
      target_path        = optional(string, "")
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        length(v.namespace_junction) >= 1 && length(v.namespace_junction) <= 10
      )
    ])
    error_message = "Each namespace_junction list must contain between 1 and 10 items"
  }
}

