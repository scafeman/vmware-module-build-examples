terraform {
  required_providers {
    vcd = {
      source = "vmware/vcd"
      version = "~> 3.8"
    }
  }
}

#####################
# VCD Security Tags #
#####################

module "vcd_security_tags" {
  source                = "github.com/global-vmware/vcd_security_tag.git?ref=v1.1.0"
  
  vdc_org_name          = "1338829-us1-rsvc-developmentenvironment"

  security_tags = {
    "pd-wordpress-web"  = ["Prod WordPress Web 01", "Prod WordPress Web 02"],
    "pd-wordpress-db"   = ["Prod WordPress DB 01", "Prod WordPress DB 02"],
    "pd-app-web"        = ["Production App Web Server 01", "Production App Web Server 02"],
    "pd-app-db"         = ["Production App DB Server 01", "Production App DB Server 02"]
  }
  
  vm_names              = ["Prod WordPress Web 01","Prod WordPress Web 02", "Prod WordPress DB 01", "Prod WordPress DB 02", "Production App Web Server 01", "Production App Web Server 02", "Production App DB Server 01", "Production App DB Server 02"]
}