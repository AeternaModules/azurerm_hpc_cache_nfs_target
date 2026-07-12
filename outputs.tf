output "hpc_cache_nfs_targets_id" {
  description = "Map of id values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.id }
}
output "hpc_cache_nfs_targets_cache_name" {
  description = "Map of cache_name values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.cache_name }
}
output "hpc_cache_nfs_targets_name" {
  description = "Map of name values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.name }
}
output "hpc_cache_nfs_targets_namespace_junction" {
  description = "Map of namespace_junction values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.namespace_junction }
}
output "hpc_cache_nfs_targets_resource_group_name" {
  description = "Map of resource_group_name values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.resource_group_name }
}
output "hpc_cache_nfs_targets_target_host_name" {
  description = "Map of target_host_name values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.target_host_name }
}
output "hpc_cache_nfs_targets_usage_model" {
  description = "Map of usage_model values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.usage_model }
}
output "hpc_cache_nfs_targets_verification_timer_in_seconds" {
  description = "Map of verification_timer_in_seconds values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.verification_timer_in_seconds }
}
output "hpc_cache_nfs_targets_write_back_timer_in_seconds" {
  description = "Map of write_back_timer_in_seconds values across all hpc_cache_nfs_targets, keyed the same as var.hpc_cache_nfs_targets"
  value       = { for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : k => v.write_back_timer_in_seconds }
}

