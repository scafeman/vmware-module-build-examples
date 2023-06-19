output "associated_virtual_service_ids" {
  value = module.vcd_nsxt_alb_pool.associated_virtual_service_ids
}

output "associated_virtual_services" {
  value = module.vcd_nsxt_alb_pool.associated_virtual_services
}

output "lb_pool_members" {
  value = module.vcd_nsxt_alb_pool.lb_pool_members
}

output "lb_member_count" {
  value = module.vcd_nsxt_alb_pool.lb_member_count
}

output "lb_up_member_count" {
  value = module.vcd_nsxt_alb_pool.lb_up_member_count
}

output "lb_enabled_member_count" {
  value = module.vcd_nsxt_alb_pool.lb_enabled_member_count
}

output "health_message" {
  value = module.vcd_nsxt_alb_pool.health_message
}

output "lb_algorithm" {
  value = module.vcd_nsxt_alb_pool.lb_algorithm
}

output "lb_default_server_port" {
  value = module.vcd_nsxt_alb_pool.lb_default_server_port
}

output "lb_persistence_profile_name" {
  value       = module.vcd_nsxt_alb_pool.lb_persistence_profile_name
}

output "lb_health_monitor_type" {
  value       = module.vcd_nsxt_alb_pool.lb_health_monitor_type
}

output "lb_health_monitor_name" {
  value       = module.vcd_nsxt_alb_pool.lb_health_monitor_name
}

output "lb_health_monitor_system_defined" {
  value       = module.vcd_nsxt_alb_pool.lb_health_monitor_system_defined
}

output "lb_member_group_ipset_name" {
  value = module.vcd_nsxt_alb_pool.lb_member_group_ipset_name
}