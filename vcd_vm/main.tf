terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

##########################
# VCD VM Module #
##########################

module "vcd_vm" {
  source                            = "github.com/global-vmware/vcd_vm.git?ref=v2.0.0"

  vdc_org_name                      = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name                    = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_name                          = "1338829-us1-default-primary-vdc"
  vdc_edge_name                     = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  catalog_name                      = "1338829-US1-catalog"
  catalog_template_name             = "Ubuntu 22.04"

  vm_sizing_policy_name             = "gp4.8"
  vm_min_cpu                        = "4"

  vm_count                          = 2

  org_networks                 = [
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
  
  network_interfaces      = [
    {
    type                  = "org"
    adapter_type          = "VMXNET3"
    name                  = "US1-Segment-01"
    ip_allocation_mode    = "POOL"
    ip                    = ""
    is_primary            = true
    },
    {
    type                  = "org"
    adapter_type          = "VMXNET3"
    name                  = "US1-Segment-02"
    ip_allocation_mode    = "POOL"
    ip                    = ""
    is_primary            = false
    }
  ]
}