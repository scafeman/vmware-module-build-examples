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

module "vcd_network_routed_v2" {
  source          = "github.com/global-vmware/vcd-network-routed-v2"
  vdc_edge_name   = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  vdc_org_name    = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name  = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vcd_network_routed_segment_segment_name = "Segment-01"
  vcd_network_routed_segment_segment_gateway = "192.168.1.1"
  vcd_network_routed_segment_start_address = "192.168.1.51"
  vcd_network_routed_segment_end_address = "192.168.1.100"
}
