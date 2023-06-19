output "alb_virtual_service_id" {
  description = "ID of the created NSX-T ALB Virtual Service"
  value       = module.nsxt_alb_virtual_service.alb_virtual_service_id
}

output "alb_virtual_service_vip" {
  description = "IP Address of the created NSX-T ALB Virtual Service"
  value       = module.nsxt_alb_virtual_service.alb_virtual_service_vip
}

output "alb_pool_id" {
  description = "ID of the NSX-T ALB Pool"
  value       = module.nsxt_alb_virtual_service.alb_pool_id
}

output "alb_pool_name" {
  description = "Name of the NSX-T ALB Pool"
  value       = module.nsxt_alb_virtual_service.alb_pool_name
}

output "alb_application_profile_type" {
  description = "Type of application profile for the NSX-T ALB Virtual Service"
  value       = module.nsxt_alb_virtual_service.alb_application_profile_type
}

output "alb_virtual_service_service_ports" {
  description = "List of service ports configuration for the NSX-T ALB Virtual Service"
  value       = module.nsxt_alb_virtual_service.alb_virtual_service_service_ports
}
