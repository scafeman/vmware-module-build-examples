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

module "vcd_vapp_web_vm" {
  source                            = "github.com/global-vmware/vcd_vapp_vm.git?ref=v1.5.0"
  
  vdc_org_name                      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name                    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_name                          = "1338829-us1-default-primary-vdc"
  vdc_edge_name                     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  catalog_name                      = "1338829-US1-catalog"
  catalog_template_name             = "Ubuntu 22.04"
  vapp_org_network_name             = "US1-Segment-01"
  network_cidr                      = "172.16.0.0/24"
  network_ip_allocation_mode        = "MANUAL"
  vm_ips                            = ["172.16.0.10", "172.16.0.11", "172.16.0.12","172.16.0.13", "172.16.0.14", "172.16.0.15"]

  vm_count                          = 2
  vm_min_cpu                        = 4
  vm_sizing_policy_name             = "gp4.8"
  
  vapp_name                         = "Production WordPress vApp"
  vm_name_environment               = "Prod"
  vm_app_name                       = "WordPress"
  vm_app_role                       = "Web"
  vm_computer_name_environment      = "pd"
  vm_computer_name_app_name         = "wp"
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

module "vcd_vapp_web_db" {
  source                            = "github.com/global-vmware/vcd_vapp_vm.git?ref=v1.5.0"
  
  vdc_org_name                      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name                    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_name                          = "1338829-us1-default-primary-vdc"
  vdc_edge_name                     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
  catalog_name                      = "1338829-US1-catalog"
  catalog_template_name             = "Ubuntu 22.04"
  vapp_org_network_name             = "US1-Segment-02"
  network_cidr                      = "172.16.1.0/24"
  network_ip_allocation_mode        = "MANUAL"
  vm_ips                            = ["172.16.1.10", "172.16.1.11", "172.16.1.12","172.16.1.13", "172.16.1.14", "172.16.1.15"]

  vm_count                          = 2
  vm_min_cpu                        = 4
  vm_sizing_policy_name             = "gp8.16"
  
  vapp_name                         = "Production WordPress vApp"
  vm_name_environment               = "Prod"
  vm_app_name                       = "WordPress"
  vm_app_role                       = "DB"
  vm_computer_name_environment      = "pd"
  vm_computer_name_app_name         = "wp"
  vm_computer_name_role             = "db"

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
      value       = "Database Server"
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

