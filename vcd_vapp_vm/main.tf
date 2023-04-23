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
  source                            = "github.com/global-vmware/vcd_vapp_vm.git?ref=v1.3.0"
  
  vdc_org_name                      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name                    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_name                          = "1338829-us1-default-primary-vdc"
  vcd_edge_name                     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  catalog_name                      = "1338829-US1-catalog"
  catalog_template_name             = "Ubuntu 22.04"
  vapp_org_network_name             = "US1-Segment-01"
  network_cidr                      = "192.168.1.0/24"
  network_ip_allocation_mode        = "MANUAL"

  vm_count                          = 2
  vm_sizing_policy_name             = "gp4.8"

  vapp_name                         = "Production BlazorApp vApp"
  vm_name_environment               = "Prod"
  vm_app_name                       = "BlazorApp"
  vm_app_role                       = "Web Server"
  vm_computer_name_environment      = "pd"
  vm_computer_name_app_name         = "ba"
  vm_computer_name_role             = "web"
  
  vm_metadata_key_01                = "Cost Center"
  vm_metadata_value_01              = "IT Department-1001"
  vm_metadata_key_02                = "Operating System"
  vm_metadata_value_02              = "Ubuntu 22.04"  
  vm_metadata_key_03                = "Role"
  vm_metadata_value_03              = "Web Server"
  vm_metadata_key_04                = "Version"
  vm_metadata_value_04              = "v1.0"  

  vm_customization_force                  = "false"
  vm_customization_auto_generate_password = "true"
  
}

