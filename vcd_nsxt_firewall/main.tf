terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

##########################################
# VCD NSX-T Edge Gateway Firewall Module #
##########################################

module "vcd_nsxt_firewall" {
  source = "github.com/global-vmware/vcd_nsxt_firewall.git?ref=v1.1.0"

  vdc_org_name    = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name  = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_edge_name   = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  app_port_profiles = {
  "HTTPS"       = "SYSTEM",
  }

  ip_set_names = [
    "US1-Segment-01-Network_172.16.0.0/24_IP-Set",
    "US1-Segment-02-Network_172.16.1.0/24_IP-Set",
    "US1-Segment-03-Network_172.16.2.0/24_IP-Set",
    "US1-Segment-04-Network_172.16.3.0/24_IP-Set",
    "US1-Segment-05-Network_172.16.4.0/24_IP-Set",
    "Prod-App-NSXT-ALB-VIP"
  ]

  rules = [
    {
      name                  = "Allow_HTTPS-->Prod-App-NSXT-ALB-VIP"
      direction             = "IN_OUT"
      ip_protocol           = "IPV4"
      action                = "ALLOW"
      app_port_profile_ids  = ["HTTPS"]
      destination_ids       = ["Prod-App-NSXT-ALB-VIP"]
    },
    {
      name                  = "Allow_Outbound-Internet"
      direction             = "IN_OUT"
      ip_protocol           = "IPV4"
      action                = "ALLOW"
      source_ids            = [
        "US1-Segment-01-Network_172.16.0.0/24_IP-Set",
        "US1-Segment-02-Network_172.16.1.0/24_IP-Set",
        "US1-Segment-03-Network_172.16.2.0/24_IP-Set",
        "US1-Segment-04-Network_172.16.3.0/24_IP-Set",
        "US1-Segment-05-Network_172.16.4.0/24_IP-Set"
      ]
    }
  ]
}