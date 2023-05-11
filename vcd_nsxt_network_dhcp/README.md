# VMware Cloud Director DHCP Terraform Module for Routed Data Center Group Networks Build Example

This directory contains an example Terraform configuration that demonstrates how to use the [vcd_nsxt_network_dhcp](https://github.com/global-vmware/vcd_nsxt_network_dhcp) Terraform Module to deploy DHCP Pools into Data Center Group Routed Networks on the [Rackspace SDDC Flex](https://www.rackspace.com/cloud/private/software-defined-data-center-flex) VMware Cloud Director Platform.

## Overview

The Terraform configuration consists of four files:

- `main.tf`: This file defines the `vcd_nsxt_network_dhcp` module that creates the DHCP pools for Data Center Group Routed Networks.
- `variables.tf`: This file defines the variables used in the `main.tf` file, such as the VDC Organization and Group details.
- `outputs.tf`: This file defines the output blocks that output the DHCP Pools, DNS Servers, and DHCP Mode that were used to provision the DHCP Service into existing Data Center Group Routed Networks.
- `providers.tf`: This file defines the `vcd` provider and specifies the connection details for VCD.

## Usage

To use this example Terraform configuration, follow these steps:

1. Install Terraform on your system.
2. Clone the `vmware-module-build-examples` repository.
3. Navigate to the `vcd_nsxt_network_dhcp` directory.
4. Create a `secrets.auto.tfvars` file and fill in the required Connection and Organization values for your vCloud Director environment.
5. Modify the `variables.tf` file with the required DHCP configurations for your NSX-T Segments.
6. Run `terraform init` to initialize the Terraform configuration.
7. Run `terraform plan` to preview the changes that Terraform will make.
8. Run `terraform apply` to create the DHCP configurations for the NSX-T Segments.
9. When you are finished, run `terraform destroy` to destroy the DHCP configurations and clean up any resources that Terraform created.

## Contributing

If you have an example of how to use the `vcd_nsxt_network_dhcp` module to create DHCP configurations for NSX-T Segments in a different environment or with different settings, we welcome your contributions. Please fork this repository, create a new directory for your example, and submit a pull request.

## Authors

This module is maintained by the [Global VMware Cloud Automation Services Team](https://github.com/global-vmware).
