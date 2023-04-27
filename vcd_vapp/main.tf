terraform {
  required_version = ">= 1.2"

  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.8.2"
    }
  }
}

module "vcd_vapp" {
  source              = "github.com/global-vmware/vcd_vapp.git?ref=v1.1.0"
  
  vdc_org_name        = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name      = "1338829-us1-rsvc-developmentenvironment datacenter group"

  vapp_names = [
    "My Prod vApp-01",
    "My Prod vApp-02"
  ]
}
