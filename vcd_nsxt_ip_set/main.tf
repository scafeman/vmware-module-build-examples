terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

####################
# VCD NSX-T IP Set #
####################

module "vcd_nsxt_ip_set" {
  source            = "github.com/global-vmware/vcd_nsxt_ip_set.git?ref=v1.1.0"

  vdc_org_name      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_edge_name     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  ip_sets = [
    {
      name          = "US1-Segment-01-Network_172.16.0.0/24_IP-Set"
      description   = "US1-Segment-01 Network IP Set"
      ip_addresses  = ["172.16.0.0/24"]
     },
    {
      name          = "US1-Segment-02-Network_172.16.1.0/24_IP-Set"
      description   = "US1-Segment-02 Network IP Set"
      ip_addresses  = ["172.16.1.0/24"]
     },
     {
      name          = "US1-Segment-03-Network_172.16.2.0/24_IP-Set"
      description   = "US1-Segment-03 Network IP Set"
      ip_addresses  = ["172.16.2.0/24"]
     },
     {
      name          = "US1-Segment-04-Network_172.16.3.0/24_IP-Set"
      description   = "US1-Segment-04 Network IP Set"
      ip_addresses  = ["172.16.3.0/24"]
     },
     {
      name          = "US1-Segment-05-Network_172.16.4.0/24_IP-Set"
      description   = "US1-Segment-05 Network IP Set"
      ip_addresses  = ["172.16.4.0/24"]
     },
  ]
}