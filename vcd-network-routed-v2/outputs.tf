output "network_name" {
  value = "${module.org_vdc_routed_network.network_name}"
}

output "network_prefix_length" {
  value = "${module.org_vdc_routed_network.network_prefix_length}"
}

output "network_dns1" {
  value = "${module.org_vdc_routed_network.network_dns1}"
}

output "network_dns2" {
  value = "${module.org_vdc_routed_network.network_dns2}"
}

output "network_dns_suffix" {
  value = "${module.org_vdc_routed_network.network_dns_suffix}"
}

output "network_gateway" {
  value = "${module.org_vdc_routed_network.network_gateway}"
}

output "network_static_ip_pool" {
  value = "${module.org_vdc_routed_network.network_static_ip_pool}"
}
