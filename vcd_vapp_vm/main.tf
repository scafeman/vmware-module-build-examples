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

module "vcd_vapp_vm" {
  source                            = "github.com/global-vmware/vcd_vapp_vm.git?ref=v1.4.0"
  
  vdc_org_name                      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name                    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_name                          = "1338829-us1-default-primary-vdc"
  vdc_edge_name                     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  catalog_name                      = "1338829-US1-catalog"
  catalog_template_name             = "Ubuntu 22.04"
  vapp_org_network_name             = "US1-Segment-01"
  network_cidr                      = "172.16.0.0/24"
  network_ip_allocation_mode        = "MANUAL"

  vm_count                          = 2
  vm_sizing_policy_name             = "gp2.4"

  vapp_name                         = "Production BlazorApp vApp"
  vm_name_environment               = "Prod"
  vm_app_name                       = "BlazorApp"
  vm_app_role                       = "Web Server"
  vm_computer_name_environment      = "pd"
  vm_computer_name_app_name         = "ba"
  vm_computer_name_role             = "web"

  vm_metadata_entries = [
    {
      key         = "Cost Center"
      value       = "IT Department - 1001"
      type        = "MetadataStringValue"
      user_access = "READWRITE"
      is_system   = false
    },
    {
      key         = "Operating System"
      value       = "Ubuntu Linux (64-Bit)"
      type        = "MetadataStringValue"
      user_access = "READWRITE"
      is_system   = false
    },
    {
      key         = "Role"
      value       = "Web Server"
      type        = "MetadataStringValue"
      user_access = "READWRITE"
      is_system   = false
    },
    {
      key         = "Build Date"
      value       = timestamp()
      type        = "MetadataDateTimeValue"
      user_access = "READWRITE"
      is_system   = false
    },
    {
      key         = "Built By"
      value       = "Rackspace Build Automation Tool"
      type        = "MetadataStringValue"
      user_access = "READWRITE"
      is_system   = false
    }    
  ]
  
  vm_customization_force                  = "false"
  vm_customization_auto_generate_password = "true"
  
}

