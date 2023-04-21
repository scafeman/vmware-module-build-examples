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
  default = "1338829-us1-rsvc-developmentenvironment"
}
variable "vdc_name" {
  description = "Cloud Director VDC Name"
  default = "1338829-us1-default-primary-vdc"
}
variable "vdc_group_name" {
  description = "Cloud Director Datacenter Group Name"
  default = "1338829-us1-rsvc-developmentenvironment datacenter group"
}
variable "vdc_edge_name" {
  description = "Cloud Director Edge Name"
  default = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
}
