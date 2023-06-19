terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

########################################
# VCD NSX-T ALB Virtual Service Module #
########################################

module "nsxt_alb_virtual_service" {
  source                        = "github.com/global-vmware/vcd_nsxt_alb_virtual_service.git?ref=v1.1.0"

  vdc_group_name                = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_org_name                  = "1338829-us1-rsvc-developmentenvironment"
  vdc_edge_name                 = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  service_engine_group_name     = "us1-rsvc-lb-segroup03"
  
  virtual_service_name          = "test-vip-01"

  pool_name                     = "test-pool-01"

  application_profile_type      = "HTTPS"

  ca_certificate_required       = true
  cert_alias                    = "US2-scafeman.com-Wildcard-Certificate-v1"

  virtual_ip_address            = "204.232.237.200"

  service_ports = [
    {
        start_port  = 443,
        type        = "TCP_PROXY",
        ssl_enabled = true,
    }
  ]
}