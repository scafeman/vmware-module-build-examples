terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}


##########################
# VCD vApp Web VM Module #
##########################

module "vcd_vapp_web_vm" {
  source                            = "github.com/global-vmware/vcd_vapp_vm.git?ref=v2.0.0"

  vdc_org_name                      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name                    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_name                          = "1338829-us1-default-primary-vdc"
  vdc_edge_name                     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  catalog_name                      = "1338829-US1-catalog"
  catalog_template_name             = "Ubuntu 22.04"

  vm_sizing_policy_name             = "gp4.8"
  vm_min_cpu                        = "4"

  vm_count                          = 2

  vapp_name                         = "My Production Application"
  vapp_org_networks = [
  { name = "US1-Segment-01" },
  { name = "US1-Segment-02" },
  ]

  vm_name                           = ["Production App Web Server"]
  vm_name_format                    = "%s %02d"
  
  computer_name                     = ["pd-app-web"]
  computer_name_format              = "%s-%02d"

  vm_metadata_entries               = [
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
      key         = "Server Role"
      value       = "Web Server"
      type        = "MetadataStringValue"
      user_access = "READWRITE"
      is_system   = false
    },
    {
      key         = "Built By"
      value       = "Build Engineering Team"
      type        = "MetadataStringValue"
      user_access = "READWRITE"
      is_system   = false
    }
  ]
  
  network_interfaces                = [
    {
    type                  = "org"
    adapter_type          = "VMXNET3"
    name                  = "US1-Segment-01"
    ip_allocation_mode    = "MANUAL"
    ip                    = ""
    is_primary            = true
    },
    {
    type                  = "org"
    adapter_type          = "VMXNET3"
    name                  = "US1-Segment-02"
    ip_allocation_mode    = "MANUAL"
    ip                    = ""
    is_primary            = false
    }
  ]

  vm_ips_index_multiplier = 2
  vm_ips                  = ["172.16.0.10", "172.16.1.10", "172.16.0.11", "172.16.1.11"]
}

#########################
# VCD vApp DB VM Module #
#########################

module "vcd_vapp_db_vm" {
  source                            = "github.com/global-vmware/vcd_vapp_vm.git?ref=v2.0.0"

  vdc_org_name                      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name                    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_name                          = "1338829-us1-default-primary-vdc"
  vdc_edge_name                     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  catalog_name                      = "1338829-US1-catalog"
  catalog_template_name             = "Ubuntu 22.04"

  vm_sizing_policy_name             = "gp4.8"
  vm_min_cpu                        = "4"

  vm_count                          = 2

  vapp_name                         = "My Production Application"
  vapp_org_networks = [
  { name = "US1-Segment-03" },
  { name = "US1-Segment-04" },
  ]

  vm_name                           = ["Production App DB Server"]
  vm_name_format                    = "%s %02d"
  
  computer_name                     = ["pd-app-db"]
  computer_name_format              = "%s-%02d"

  vm_metadata_entries               = [
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
      key         = "Server Role"
      value       = "Database Server"
      type        = "MetadataStringValue"
      user_access = "READWRITE"
      is_system   = false
    },
    {
      key         = "Built By"
      value       = "Build Engineering Team"
      type        = "MetadataStringValue"
      user_access = "READWRITE"
      is_system   = false
    }
  ]
  
  network_interfaces                = [
    {
    type                  = "org"
    adapter_type          = "VMXNET3"
    name                  = "US1-Segment-03"
    ip_allocation_mode    = "MANUAL"
    ip                    = ""
    is_primary            = true
    },
    {
    type                  = "org"
    adapter_type          = "VMXNET3"
    name                  = "US1-Segment-04"
    ip_allocation_mode    = "MANUAL"
    ip                    = ""
    is_primary            = false
    }
  ]

  vm_ips_index_multiplier = 2
  vm_ips                  = ["172.16.2.10", "172.16.3.10", "172.16.2.11", "172.16.3.11"]
}