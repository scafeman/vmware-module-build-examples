terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.8.2"
    }
  }
}


#########################
# Org VDC Routed Network
######################### 

module "vapp_vm" {
  source = "github.com/global-vmware/vcd_vapp_vm.git?ref=v1.1.0"
  
  vdc_org_name                      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name                    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_name                          = "1338829-us1-default-primary-vdc"
  vcd_edge_name                     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  catalog_name                      = "1338829-US1-catalog"


  vapp_name                         = "My Development Application"
  vapp_org_network_name             = "US1-Segment-01"
  catalog_template_name             = "Windows Server 2019"
  vm_name_environment               = "Dev"
  vm_computer_name_environment      = "dv"
  vm_count                          = 1
  network_cidr                      = "192.168.0.0/24"
  vm_metadata_os                    = "Windows 2019"
}

