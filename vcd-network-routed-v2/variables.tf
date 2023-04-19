variable "vcd_user" {
  description = "Cloud Director Username"
  type        = string
  sensitive   = true
}
variable "vcd_pass" {
  description = "Cloud Director Password"
  type        = string
  sensitive   = true
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
  default = "1338829-us1-default-primary-vdc-Default"
}
variable "vdc_group_name" {
  description = "Cloud Director Datacenter Group Name"
  default = "1338829-us1-rsvc-developmentenvironment datacenter group"
}
variable "vdc_edge_name" {
  description = "Cloud Director Edge Name"
  default = "1338829-US1-18916d0c-4c6d-42c3-be95-b911ee2119fb-edge"
}

variable "prefix_length" {
  description = "CIDR notation prefix length for the 24-bit network"
  default = "24"
}

variable "segment_name" {
  description = "Name of the segment routed network"
  default = "segment"
}

variable "segment_gateway" {
  description = "Gateway IP address for the segment routed network"
  default = "192.168.50.1"
}

variable "start_address" {
  description = "Start IP address of the static IP pool for the segment network"
  default = "192.168.50.51"
}

variable "end_address" {
  description = "End IP address of the static IP pool for the segment network"
  default = "192.168.50.100"
}

variable "dns1_address" {
  description = "Primary DNS server address for the segment network"
  default = "69.20.0.164"
}

variable "dns2_address" {
  description = "Secondary DNS server address for the segment network"
  default = "69.20.0.196"
}

variable "dns_suffix" {
  description = "DNS suffix for the segment network"
  default = "segment.local"
}
