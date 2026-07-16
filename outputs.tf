output "hpc_cache_nfs_targets_id" {
  description = "Map of id values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.id if v.id != null && length(v.id) > 0 }
}
output "hpc_cache_nfs_targets_cache_name" {
  description = "Map of cache_name values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.cache_name if v.cache_name != null && length(v.cache_name) > 0 }
}
output "hpc_cache_nfs_targets_name" {
  description = "Map of name values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.name if v.name != null && length(v.name) > 0 }
}
output "hpc_cache_nfs_targets_namespace_junction" {
  description = "Map of namespace_junction values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.namespace_junction if v.namespace_junction != null && length(v.namespace_junction) > 0 }
}
output "hpc_cache_nfs_targets_resource_group_name" {
  description = "Map of resource_group_name values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "hpc_cache_nfs_targets_target_host_name" {
  description = "Map of target_host_name values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.target_host_name if v.target_host_name != null && length(v.target_host_name) > 0 }
}
output "hpc_cache_nfs_targets_usage_model" {
  description = "Map of usage_model values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.usage_model if v.usage_model != null && length(v.usage_model) > 0 }
}
output "hpc_cache_nfs_targets_verification_timer_in_seconds" {
  description = "Map of verification_timer_in_seconds values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.verification_timer_in_seconds if v.verification_timer_in_seconds != null }
}
output "hpc_cache_nfs_targets_write_back_timer_in_seconds" {
  description = "Map of write_back_timer_in_seconds values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.write_back_timer_in_seconds if v.write_back_timer_in_seconds != null }
}

