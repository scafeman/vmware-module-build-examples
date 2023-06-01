output "vdc_group_id" {
  value = module.vcd_nsxt_security_group.vdc_group_id
}

output "edge_gateway_id" {
  value = module.vcd_nsxt_security_group.edge_gateway_id
}

output "org_vdc_routed_network_ids" {
  value = module.vcd_nsxt_security_group.org_vdc_routed_network_ids
}

output "security_group_ids" {
  value = module.vcd_nsxt_security_group.security_group_ids
}
