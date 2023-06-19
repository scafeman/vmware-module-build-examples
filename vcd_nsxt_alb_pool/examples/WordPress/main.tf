terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

#############################
# VCD NSX-T ALB Pool Module #
#############################

module "vcd_nsxt_alb_pool" {
  source          = "github.com/global-vmware/vcd_nsxt_alb_pool.git?ref=v1.2.0"
  
  vdc_group_name  = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_org_name    = "1338829-us1-rsvc-developmentenvironment"
  vdc_edge_name   = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  pool_name                 = "test-pool-01"

  default_port              = 443

  use_member_group          = true
  member_group_ip_set_name  = "US1-WordPress-Prod-Web-Pool"

  algorithm                 = "LEAST_LOAD"

  persistence_profile = [
    {
      type  = "CLIENT_IP"
      value = ""
    }
  ]

  health_monitor  = [
    {
      type = "PING"
    }
  ]

  ca_certificate_name		= "US2-scafeman.com-Wildcard-Certificate-v1"
}