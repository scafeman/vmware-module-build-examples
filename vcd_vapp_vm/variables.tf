variable "vcd_user" {
  description = "Cloud Director Username"
  type        = string
  sensitive   = true
  default     = ""
}
variable "vcd_pass" {
  description = "Cloud Director Password"
  type        = string
  sensitive   = true
  default     = ""
}
variable "vcd_url" {
  description = "Cloud Director URL"
  default = "https://us1.rsvc.rackspace.com/api"
}
variable "vcd_max_retry_timeout" {
  default = 90
}
variable "vcd_allow_unverified_ssl" {
  default = true
}
variable "vdc_org_name" {
  description = "Cloud Director Organization Name"
  default = ""
}
variable "vdc_name" {
  description = "Cloud Director VDC Name"
  default = ""
}
variable "vdc_group_name" {
  description = "Cloud Director Datacenter Group Name"
  default = ""
}
variable "vdc_edge_name" {
  description = "Cloud Director Edge Name"
  default = ""
}

variable "admin_password" {
  description = "VM Administrator Password"
  default = ""
}