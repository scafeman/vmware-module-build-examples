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
  catalog_template_name             = "Windows Server 2019"
  vapp_org_network_name             = "US1-Segment-01"
  network_cidr                      = "192.168.1.0/24"
  network_ip_allocation_mode        = "POOL"

  vm_count                          = 2

  vapp_name                         = "My Development Application"
  vm_name_environment               = "Dev"
  vm_app_name                       = "MyApp"
  vm_app_role                       = "Web Server"
  vm_computer_name_environment      = "dv"
  vm_computer_name_app_name         = "myapp"
  vm_computer_name_role             = "web"
  
  vm_metadata_cost_center           = "IT Department-1001"
  vm_metadata_os                    = "Windows 2019"
  vm_metadata_role                  = "Web Server"
  vm_metadata_version               = "1.0"
  
}

