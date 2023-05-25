terraform {
  required_version = ">= 1.2"

  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

###################
# VCD vApp Module #
###################

module "vcd_vapp" {
  source              = "github.com/global-vmware/vcd_vapp.git?ref=v1.1.1"
  
  vdc_org_name        = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name      = "1338829-us1-rsvc-developmentenvironment datacenter group"

  vapp_names = ["My Production Application"]
}
