# VMware Cloud Director NSX-T IP Set Terraform Build Example

This directory contains an example Terraform configuration that demonstrates how to use the [vcd_nsxt_ip_set](https://github.com/global-vmware/vcd_nsxt_ip_set) Terraform Module to deploy NSX-T IP Sets into the [Rackspace SDDC Flex](https://www.rackspace.com/cloud/private/software-defined-data-center-flex) VMware Cloud Director Platform.

## Overview

The Terraform configuration consists of four files:

- `main.tf`: This file defines the `vcd_nsxt_dynamic_security_group` module that creates the NSX-T Dynamic Security Groups.
- `variables.tf`: This file defines the variables used in the `main.tf` file, such as the VDC Organization Details.
- `outputs.tf`: This file defines an `output` block that outputs the list of vApps that were deployed.
- `providers.tf`: This file defines the `vcd` provider and specifies the connection details for VMware Cloud Director.

## Usage

To use this example Terraform configuration, follow these steps:

1. Install Terraform on your system.
2. Clone the `vmware-module-build-examples` repository.
3. Navigate to the `vcd_nsxt_dynamic_security_group` directory.
4. Create a `secrets.auto.tfvars` file and fill in the required Connection and Organization values for your VMware Cloud Director environment.
5. Run `terraform init` to initialize the Terraform configuration.
6. Run `terraform plan` to preview the changes that Terraform will make.
7. Run `terraform apply` to create the vApp and its components.
8. When you are finished, run `terraform destroy` to delete the vApp and its components and clean up any resources that Terraform created.

## Contributing

If you have an example of how to use the `vcd_nsxt_dynamic_security_group` module to create NSX-T IP Sets in a different environment or with different settings, we welcome your contributions. Please fork this repository, create a new directory for your example, and submit a pull request.

## Authors

This module is maintained by the [Global VMware Cloud Automation Services Team](https://github.com/global-vmware).
