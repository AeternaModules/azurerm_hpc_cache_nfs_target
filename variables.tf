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
      access_policy_name = optional(string)
      namespace_path     = string
      nfs_export         = string
      target_path        = optional(string)
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
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        length(v.cache_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        alltrue([for item in v.namespace_junction : (item.access_policy_name == null || (length(item.access_policy_name) > 0))])
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        length(v.target_host_name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        contains(["READ_HEAVY_INFREQ", "READ_HEAVY_CHECK_180", "READ_ONLY", "READ_WRITE", "WRITE_WORKLOAD_15", "WRITE_AROUND", "WRITE_WORKLOAD_CHECK_30", "WRITE_WORKLOAD_CHECK_60", "WRITE_WORKLOAD_CLOUDWS"], v.usage_model)
      )
    ])
    error_message = "must be one of: READ_HEAVY_INFREQ, READ_HEAVY_CHECK_180, READ_ONLY, READ_WRITE, WRITE_WORKLOAD_15, WRITE_AROUND, WRITE_WORKLOAD_CHECK_30, WRITE_WORKLOAD_CHECK_60, WRITE_WORKLOAD_CLOUDWS"
  }
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        v.verification_timer_in_seconds == null || (v.verification_timer_in_seconds >= 1 && v.verification_timer_in_seconds <= 31536000)
      )
    ])
    error_message = "must be between 1 and 31536000"
  }
  validation {
    condition = alltrue([
      for k, v in var.hpc_cache_nfs_targets : (
        v.write_back_timer_in_seconds == null || (v.write_back_timer_in_seconds >= 1 && v.write_back_timer_in_seconds <= 31536000)
      )
    ])
    error_message = "must be between 1 and 31536000"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

