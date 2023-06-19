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
  catalog_template_name             = "WordPress-Dev-Web-Template-v1.0"

  vm_sizing_policy_name             = "gp4.8"
  vm_min_cpu                        = "4"

  vm_count                          = 2

  vapp_name                         = "Production WordPress vApp"
  vapp_org_networks = [
  { name = "US1-Segment-01" },
  { name = "US1-Segment-02" },
  ]

  vm_name                           = ["Prod WordPress Web 01", "Prod WordPress Web 02"]
  vm_name_format                    = ""
  
  computer_name                     = ["p-wp-web01", "p-wp-web02"]
  computer_name_format              = ""

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
  
  disks_per_vm = 1
  vm_disks = [
    {
      name          = "WordPress-Web01-DataDisk01"
      bus_number    = 1
      unit_number   = 0
    },
    {
      name          = "WordPress-Web02-DataDisk01"
      bus_number    = 1
      unit_number   = 0
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

  override_template_disks = [
    {
      bus_type        = "paravirtual"
      size_in_mb      = 51200
      bus_number      = 0
      unit_number     = 0
      iops            = 0
      storage_profile = "Standard"
    }
  ]
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
  catalog_template_name             = "Ubuntu 22.04-Template-v1.0"

  vm_sizing_policy_name             = "gp4.8"
  vm_min_cpu                        = "4"

  vm_count                          = 2

  vapp_name                         = "Production WordPress vApp"
  vapp_org_networks = [
  { name = "US1-Segment-03" },
  { name = "US1-Segment-04" },
  ]

  vm_name                           = ["Prod WordPress DB 01", "Prod WordPress DB 02"]
  vm_name_format                    = ""
  
  computer_name                     = ["p-wp-db01", "p-wp-db02"]
  computer_name_format              = ""

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
  
  disks_per_vm = 2
  vm_disks = [
    {
      name          = "WordPress-DB01-SqlDataDisk01"
      bus_number    = 1
      unit_number   = 0
    },
    {
      name          = "WordPress-DB01-SqlLogDisk01"
      bus_number    = 1
      unit_number   = 1
    },
    {
      name          = "WordPress-DB02-SqlDataDisk01"
      bus_number    = 1
      unit_number   = 0
    },
    {
      name          = "WordPress-DB02-SqlLogDisk01"
      bus_number    = 1
      unit_number   = 1
    }
  ]

  network_interfaces                = [
    {
    type                  = "org"
    adapter_type          = "VMXNET3"
    name                  = "US1-Segment-03"
    ip_allocation_mode    = "POOL"
    ip                    = ""
    is_primary            = true
    },
    {
    type                  = "org"
    adapter_type          = "VMXNET3"
    name                  = "US1-Segment-04"
    ip_allocation_mode    = "POOL"
    ip                    = ""
    is_primary            = false
    }
  ]

  vm_ips_index_multiplier = 2
  vm_ips                  = ["172.16.2.10", "172.16.3.10", "172.16.2.11", "172.16.3.11"]

  override_template_disks = [
    {
      bus_type        = "paravirtual"
      size_in_mb      = 102400
      bus_number      = 0
      unit_number     = 0
      iops            = 0
      storage_profile = "Performance"
    }
  ]
}