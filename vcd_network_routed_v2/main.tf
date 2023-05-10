terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}


#########################
# Org VDC Routed Network
######################### 

module "org_vdc_routed_network" {
  source              = "github.com/global-vmware/vcd_network_routed_v2.git?ref=v1.3.0"
  
  vdc_edge_name       = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  vdc_org_name        = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name      = "1338829-us1-rsvc-developmentenvironment datacenter group"

  segments = {
    US1-Segment-01 = {
      gateway       = "172.16.0.1"
      prefix_length = 24
      dns1          = "192.168.255.228"
      dns2          = ""
      dns_suffix    = "mydomain.com"
      start_address = "172.16.0.50"
      end_address   = "172.16.0.100"      
    },
    US1-Segment-02 = {
      gateway       = "172.16.1.1"
      prefix_length = 24
      dns1          = "192.168.255.228"
      dns2          = ""
      dns_suffix    = "mydomain.com"
      start_address = "172.16.1.50"
      end_address   = "172.16.1.100"      
    },
    US1-Segment-03 = {
      gateway       = "172.16.2.1"
      prefix_length = 24
      dns1          = "192.168.255.228"
      dns2          = ""
      dns_suffix    = "mydomain.com"
      start_address = "172.16.2.50"
      end_address   = "172.16.2.100"      
    },
    US1-Segment-04 = {
      gateway       = "172.16.3.1"
      prefix_length = 24
      dns1          = "192.168.255.228"
      dns2          = ""
      dns_suffix    = "mydomain.com"
      start_address = "172.16.3.50"
      end_address   = "172.16.3.100"      
    },
    US1-Segment-05 = {
      gateway       = "172.16.4.1"
      prefix_length = 24
      dns1          = "192.168.255.228"
      dns2          = ""
      dns_suffix    = "mydomain.com"
      start_address = "172.16.4.50"
      end_address   = "172.16.4.100"      
    }
  }
}

