terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

#########################################
# VCD NSX-T Distributed Firewall Module #
#########################################

module "vcd_nsxt_distributed_firewall" {
  source = "github.com/global-vmware/vcd_nsxt_distributed_firewall.git?ref=v1.1.0"

  vdc_org_name    = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name  = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_edge_name   = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  app_port_profiles = {
  "HTTP"        = "SYSTEM",
  "HTTPS"       = "SYSTEM",
  "MS-SQL-S"    = "SYSTEM",
  "MySQL"       = "SYSTEM",
  "RDP"         = "SYSTEM",
  "SSH"         = "SYSTEM",
  "ICMP ALL"    = "SYSTEM"
}

  ip_set_names = [
    "US1-Segment-01-Network_172.16.0.0/24_IP-Set",
    "US1-Segment-02-Network_172.16.1.0/24_IP-Set",
    "US1-Segment-03-Network_172.16.2.0/24_IP-Set",
    "US1-Segment-04-Network_172.16.3.0/24_IP-Set",
    "US1-Segment-05-Network_172.16.4.0/24_IP-Set",
    "Default_IP_SET_10.0.2.0/24",
    "US1-NSXT-ALB_Service"
  ]

  dynamic_security_group_names = [
    "Prod-App-Web_Dynamic-SG",
    "Prod-App-DB_Dynamic-SG"
  ]

  rules = [
    {
      name                  = "Allow_Prod-App-Web-->Prod-App-DB"
      direction             = "IN_OUT"
      ip_protocol           = "IPV4"
      action                = "ALLOW"
      app_port_profile_ids  = ["MS-SQL-S"]
      source_ids            = ["Prod-App-Web_Dynamic-SG"]
      destination_ids       = ["Prod-App-DB_Dynamic-SG"]
    },
    {
      name                  = "Allow_US1-NSXT-ALB-->Prod-App-Web"
      direction             = "IN_OUT"
      ip_protocol           = "IPV4"
      action                = "ALLOW"
      app_port_profile_ids  = ["HTTPS"]
      source_ids            = ["US1-NSXT-ALB_Service"]
      destination_ids       = ["Prod-App-Web_Dynamic-SG"]
    },
    {
      name                  = "Allow_US1-Segment-03-->US1-Segment-01"
      direction             = "IN_OUT"
      ip_protocol           = "IPV4"
      action                = "ALLOW"
      app_port_profile_ids  = ["SSH", "RDP", "HTTP", "HTTPS"]
      source_ids            = ["US1-Segment-03-Network_172.16.2.0/24_IP-Set"]
      destination_ids       = ["US1-Segment-01-Network_172.16.0.0/24_IP-Set"]
    },
    {
      name                  = "Allow_US1-Segment03-->US1-Segment-04"
      direction             = "IN_OUT"
      ip_protocol           = "IPV4"
      action                = "ALLOW"
      app_port_profile_ids  = ["HTTP", "HTTPS", "MS-SQL-S", "MySQL"]
      source_ids            = ["US1-Segment-03-Network_172.16.2.0/24_IP-Set"]
      destination_ids       = ["US1-Segment-04-Network_172.16.3.0/24_IP-Set"]
    },
    {
      name                  = "Allow_ICMP-ALL"
      direction             = "IN_OUT"
      ip_protocol           = "IPV4"
      action                = "ALLOW"
      app_port_profile_ids  = ["ICMP ALL"]
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
        "US1-Segment-05-Network_172.16.4.0/24_IP-Set",
        "Default_IP_SET_10.0.2.0/24"
      ]
    },
    {
      name                  = "Default_Drop"
      direction             = "IN_OUT"
      ip_protocol           = "IPV4"
      action                = "DROP"
    }
  ]
}