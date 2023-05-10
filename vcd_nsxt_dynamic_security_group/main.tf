terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

###########################################
# VCD NSX-T Dynamic Security Group Module #
###########################################

module "vcd_nsxt_dynamic_security_group" {
  source            = "github.com/global-vmware/vcd_nsxt_dynamic_security_group.git?ref=v1.1.0"

  vdc_org_name      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name    = "1338829-us1-rsvc-developmentenvironment datacenter group"

  dynamic_security_groups = {
    WordPress-Web_Dynamic-SG = {
      description = "WordPress Web Servers Dynamic Security Group"
      criteria    = [
        {
          type     = "VM_NAME"
          operator = "CONTAINS"
          value    = "WordPress Web"
        }
      ]
    },
    WordPress-DB_Dynamic-SG = {
      description = "WordPress Database Servers Dynamic Security Group"
      criteria    = [
        {
          type     = "VM_NAME"
          operator = "CONTAINS"
          value    = "WordPress DB"
        }
      ]
    }
  }
}