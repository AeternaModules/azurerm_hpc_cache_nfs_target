output "hpc_cache_nfs_targets" {
  description = "All hpc_cache_nfs_target resources"
  value       = azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets
}
output "hpc_cache_nfs_targets_cache_name" {
  description = "List of cache_name values across all hpc_cache_nfs_targets"
  value       = [for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : v.cache_name]
}
output "hpc_cache_nfs_targets_name" {
  description = "List of name values across all hpc_cache_nfs_targets"
  value       = [for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : v.name]
}
output "hpc_cache_nfs_targets_namespace_junction" {
  description = "List of namespace_junction values across all hpc_cache_nfs_targets"
  value       = [for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : v.namespace_junction]
}
output "hpc_cache_nfs_targets_resource_group_name" {
  description = "List of resource_group_name values across all hpc_cache_nfs_targets"
  value       = [for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : v.resource_group_name]
}
output "hpc_cache_nfs_targets_target_host_name" {
  description = "List of target_host_name values across all hpc_cache_nfs_targets"
  value       = [for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : v.target_host_name]
}
output "hpc_cache_nfs_targets_usage_model" {
  description = "List of usage_model values across all hpc_cache_nfs_targets"
  value       = [for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : v.usage_model]
}
output "hpc_cache_nfs_targets_verification_timer_in_seconds" {
  description = "List of verification_timer_in_seconds values across all hpc_cache_nfs_targets"
  value       = [for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : v.verification_timer_in_seconds]
}
output "hpc_cache_nfs_targets_write_back_timer_in_seconds" {
  description = "List of write_back_timer_in_seconds values across all hpc_cache_nfs_targets"
  value       = [for k, v in azurerm_hpc_cache_nfs_target.hpc_cache_nfs_targets : v.write_back_timer_in_seconds]
}

