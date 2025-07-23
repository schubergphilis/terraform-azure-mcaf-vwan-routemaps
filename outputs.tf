output "route_map_ids" {
  description = "The IDs of the route maps that were created"
  value       = { for k, v in azurerm_route_map.this : k => v.id }
}
