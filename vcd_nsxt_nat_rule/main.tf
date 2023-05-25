terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

######################
# VCD NSX-T NAT Rule #
######################

module "vcd_nsxt_nat_rule" {
  source                      = "github.com/global-vmware/vcd_nsxt_nat_rule.git?ref=v1.2.0"

  vdc_org_name                = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name              = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_edge_name               = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  nat_rules = {
    "172.16.0.0/24_SNAT"    = {
      rule_type               = "SNAT"
      name                    = "172.16.0.0/24_SNAT"
      description             = "SNAT Rule for the US1-Segment-01"
      external_address        = "204.232.237.140"
      internal_address        = "172.16.0.0/24"
    },
    "172.16.0.10_DNAT-HTTP" = {
      rule_type               = "DNAT"
      name                    = "172.16.0.10_DNAT-HTTP"
      external_address        = "204.232.237.140"
      internal_address        = "172.16.0.10"
      dnat_external_port      = "80"
    },
    "172.16.0.10_DNAT-SSH" = {
      rule_type               = "DNAT"
      name                    = "172.16.0.10_DNAT-SSH"
      external_address        = "204.232.237.140"
      internal_address        = "172.16.0.10"
      dnat_external_port      = "22"
    },
    "172.16.1.0/24_SNAT"    = {
      rule_type               = "SNAT"
      name                    = "172.16.1.0/24_SNAT"
      description             = "SNAT Rule for the US1-Segment-02"
      external_address        = "204.232.237.141"
      internal_address        = "172.16.1.0/24"
    }
  }
}