terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

###############################
# VCD Independent Disk Module #
###############################

module "vcd_independent_disk" {
  source                = "github.com/global-vmware/vcd_independent_disk.git?ref=v1.1.0"

  vdc_org_name          = "1338829-us1-rsvc-developmentenvironment"

  disk_params = [ 
    {
      name              = "WordPress-Web01-DataDisk01"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "VirtualSCSI"
      storage_profile   = "Standard"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "WordPress-Web02-DataDisk01"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "VirtualSCSI"
      storage_profile   = "Standard"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "WordPress-DB01-SqlDataDisk01"
      size_in_mb        = "204800"
      bus_type          = "SCSI"
      bus_sub_type      = "VirtualSCSI"
      storage_profile   = "Performance"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "WordPress-DB01-SqlLogDisk01"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "VirtualSCSI"
      storage_profile   = "Performance"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "WordPress-DB02-SqlDataDisk01"
      size_in_mb        = "204800"
      bus_type          = "SCSI"
      bus_sub_type      = "VirtualSCSI"
      storage_profile   = "Performance"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "WordPress-DB02-SqlLogDisk01"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "VirtualSCSI"
      storage_profile   = "Performance"
      sharing_type      = "None"
      metadata          = []
    }
  ]    
}