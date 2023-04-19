terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.8.2"
    }
  }
}

# Connect to the VMware Cloud Director Provider
provider "vcd" {
user                  = var.vcd_user
password              = var.vcd_pass
auth_type             = "integrated"
org                   = var.vdc_org_name
vdc                   = var.vdc_name
url                   = var.vcd_url
max_retry_timeout     = var.vcd_max_retry_timeout
allow_unverified_ssl  = var.vcd_allow_unverified_ssl
}


# Create the Datacenter Group data source
data "vcd_vdc_group" "dcgroup" {
  name = var.vdc_group_name
}

# Create the NSX-T Edge Gateway data source
data "vcd_nsxt_edgegateway" "t1" {
  org      = var.vdc_org_name
  owner_id = data.vcd_vdc_group.dcgroup.id
  name     = var.vdc_edge_name
}

#########################
# Org VDC Routed Network
######################### 

module "segment" {
  source = "github.com/global-vmware/vcd-network-routed-v2.git"
  org             = var.vdc_org_name
  name            = var.vcd_network_routed_segment_segment_name
  edge_gateway_id = data.vcd_nsxt_edgegateway.t1.id

  gateway         = var.vcd_network_routed_segment_segment_gateway
  prefix_length   = var.vcd_network_routed_prefix_length_24
  dns1            = var.vcd_network_routed_segment_dns1_server_address
  dns2            = var.vcd_network_routed_segment_dns2_server_address
  dns_suffix      = var.vcd_network_routed_segment_dns_suffix

  static_ip_pool {
    start_address = var.vcd_network_routed_segment_start_address
    end_address   = var.vcd_network_routed_segment_end_address
  }
}
