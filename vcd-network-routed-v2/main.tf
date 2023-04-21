terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.8.2"
    }
  }
}


#########################
# Org VDC Routed Network
######################### 

module "org-vdc-routed-network" {
  source          = "github.com/global-vmware/vcd-network-routed-v2.git?ref=v1.1.0"

  vdc_edge_name   = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  vdc_org_name    = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name  = "1338829-us1-rsvc-developmentenvironment datacenter group"
  segment_name    = "US1-Segment-01"
  dns_suffix      = "rackspace.local"

}
