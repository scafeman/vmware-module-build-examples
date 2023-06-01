output "firewall_id" {
  description = "The ID of the firewall"
  value       = module.vcd_nsxt_firewall.firewall_id
}

output "firewall_rule_names" {
  description = "The names of the firewall rules"
  value       = module.vcd_nsxt_firewall.firewall_rule_names
}
