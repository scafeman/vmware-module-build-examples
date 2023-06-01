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
      name              = "Prod-App-Web01-WebDataDisk01"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "lsilogicsas"
      storage_profile   = "Standard"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "Prod-App-Web01-WebLogDisk01"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "lsilogicsas"
      storage_profile   = "Standard"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "Prod-App-Web02-WebDataDisk01"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "lsilogicsas"
      storage_profile   = "Standard"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "Prod-App-Web02-WebLogDisk01"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "lsilogicsas"
      storage_profile   = "Standard"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "Prod-App-DB01-SqlDataDisk01"
      size_in_mb        = "204800"
      bus_type          = "SCSI"
      bus_sub_type      = "lsilogicsas"
      storage_profile   = "Performance"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "Prod-App-DB01-SqlLogDisk02"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "lsilogicsas"
      storage_profile   = "Performance"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "Prod-App-DB02-SqlDataDisk01"
      size_in_mb        = "204800"
      bus_type          = "SCSI"
      bus_sub_type      = "lsilogicsas"
      storage_profile   = "Performance"
      sharing_type      = "None"
      metadata          = []
    },
    {
      name              = "Prod-App-DB02-SqlLogDisk02"
      size_in_mb        = "102400"
      bus_type          = "SCSI"
      bus_sub_type      = "lsilogicsas"
      storage_profile   = "Performance"
      sharing_type      = "None"
      metadata          = []
    }
  ]    
}