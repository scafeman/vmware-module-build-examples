terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "3.9.0"
    }
  }
}

###########################################
# VCD NSX-T Security Group Module #
###########################################

module "vcd_nsxt_security_group" {
  source              = "github.com/global-vmware/vcd_nsxt_security_group.git?ref=v1.2.0"

  vdc_org_name        = "1338829-us1-rsvc-developmentenvironment"
  vdc_group_name      = "1338829-us1-rsvc-developmentenvironment datacenter group"
  vdc_edge_name       = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"

  org_network_names = [
    {
        name = "US1-Segment-01"
    },
    {
        name = "US1-Segment-02"
    },
    {
        name = "US1-Segment-03"
    },
    {
        name = "US1-Segment-04"
    },
    {
        name = "US1-Segment-05"
    }
  ]

  security_groups = {
    "US1-Segment-01_Static-Group" = {
        description       = "US1 Segment 01 Security Group"
        org_network_names = ["US1-Segment-01"]
    },
    "US1-Segment-02_Static-Group" = {
        description       = "US1 Segment 02 Security Group"
        org_network_names = ["US1-Segment-02"]
    },
    "US1-Segment-03_Static-Group" = {
        description       = "US1 Segment 03 Security Group"
        org_network_names = ["US1-Segment-03"]
    },
    "US1-Segment-04_Static-Group" = {
        description       = "US1 Segment 04 Security Group"
        org_network_names = ["US1-Segment-04"]
    },
    "US1-Segment-05_Static-Group" = {
        description       = "US1 Segment 05 Security Group"
        org_network_names = ["US1-Segment-05"]
    }  
  }
}