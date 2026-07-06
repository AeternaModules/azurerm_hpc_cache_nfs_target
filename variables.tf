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
      access_policy_name = optional(string) # Default: "default"
      namespace_path     = string
      nfs_export         = string
      target_path        = optional(string) # Default: ""
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
        length(v.cache_name) > 0
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
  # --- Unconfirmed validation candidates, derived from azurerm_hpc_cache_nfs_target's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.StorageTargetName] !ok
  # path: name
  #   source:    [from validate.StorageTargetName] !p.MatchString(v)
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
  # path: namespace_junction.namespace_path
  #   source:    validate.CacheNamespacePath: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: namespace_junction.nfs_export
  #   source:    validate.CacheNFSExport: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: namespace_junction.target_path
  #   source:    validate.CacheNFSTargetPath: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: namespace_junction.access_policy_name
  #   condition: length(value) > 0
  #   message:   must not be empty
}

