output "id" {
  description = "The resource ID in UUID format"
  value       = huaweicloud_cce_node_pool.main.id
}

output "status" {
  description = "Node status information"
  value       = huaweicloud_cce_node_pool.main.status
}

output "current_node_count" {
  description = "The current number of the nodes"
  value       = huaweicloud_cce_node_pool.main.current_node_count
}
