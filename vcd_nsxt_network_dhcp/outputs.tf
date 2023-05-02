output "dhcp_pools" {
  value = module.vcd_nsxt_network_dhcp.dhcp_pools
}

output "dhcp_dns_servers" {
  value = module.vcd_nsxt_network_dhcp.dhcp_mode == "RELAY" ? null : module.vcd_nsxt_network_dhcp.dhcp_dns_servers
}

output "dhcp_listener_ips" {
  value = { for segment_key, segment in module.vcd_nsxt_network_dhcp.dhcp_listener_ips : segment_key => segment.listener_ip_address if can(index(segment, "listener_ip_address")) }
}

output "dhcp_mode" {
  value = module.vcd_nsxt_network_dhcp.dhcp_mode
}
