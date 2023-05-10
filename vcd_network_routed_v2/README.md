# VMware Cloud Director Routed v2 Network Terraform Build Example Example

This directory contains an example Terraform configuration that demonstrates how to use the [vcd_network_routed_v2](https://github.com/global-vmware/vcd_network_routed_v2) Terraform Module to deploy Data Center Group Organization Networks into the Rackspace SDDC Flex VMware Cloud Director Platform.

## Overview

The Terraform configuration consists of four files:

- `main.tf`: This file defines the `vcd_network_routed_v2` module that creates the Data Center Group Organization Networks.
- `variables.tf`: This file defines the variables used in the `main.tf` file, such as the VCD Connection and the VDC Organization Details.
- `outputs.tf`: This file defines an `output` block that outputs the DC Org Networks that were deployed.
- `providers.tf`: This file defines the `vcd` provider and specifies the connection details for VCD.

## Usage

To use this example Terraform configuration, follow these steps:

1. Install Terraform on your system.
2. Clone the `vmware-module-build-examples` repository.
3. Navigate to the `vcd_network_routed_v2` directory.
4. Create a `secrets.auto.tfvars` file and fill in the required Connection and Organization values for your vCloud Director environment.
5. Run `terraform init` to initialize the Terraform configuration.
6. Run `terraform plan` to preview the changes that Terraform will make.
7. Run `terraform apply` to create the routed v2 network.
8. When you are finished, run `terraform destroy` to destroy the DC Org Networks and clean up any resources that Terraform created.

## Contributing

If you have an example of how to use the `vcd_network_routed_v2` module to create Data Center Group Organization Networks in a different environment or with different settings, we welcome your contributions. Please fork this repository, create a new directory for your example, and submit a pull request.

## Authors

This module is maintained by the [Global VMware Cloud Automation Services Team](https://github.com/global-vmware).
