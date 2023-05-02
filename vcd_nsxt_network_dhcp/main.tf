terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}


###########################################
# DHCP Pools for DC Group Routed Networks #
########################################### 

module "vcd_nsxt_network_dhcp" {
  source                    = "github.com/global-vmware/vcd_nsxt_network_dhcp.git?ref=v1.1.0"
  
  vdc_org_name              = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name            = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_edge_name             = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  dhcp_mode                 = "EDGE"

  dns_servers               = ["192.168.255.228"]

  segments = {
    "US1-Segment-01" = {
        gateway             = "172.16.0.1"
        prefix_length       = 24
        dns_suffix          = "mydomain.com"
        listener_ip_address = "172.16.0.10"
        pool_ranges         = [
        {
            start_address   = "172.16.0.101"
            end_address     = "172.16.0.200"
        }
        ]    
    },
    "US1-Segment-02" = {
      gateway             = "172.16.1.1"
      prefix_length       = 24
      dns_suffix          = "mydomain.com"
      listener_ip_address = "172.16.1.10"
      pool_ranges         = [
        {
            start_address = "172.16.1.101"
            end_address   = "172.16.1.200"
        }
      ]    
    }
  }
}