# VMware Cloud Director Virtual Machine Terraform Module Build Example

This directory contains an example Terraform configuration that demonstrates how to use the [vcd_vm](https://github.com/global-vmware/vcd_vm) Terraform Module to deploy Virtual Machines into the Rackspace SDDC Flex VMware Cloud Director Platform.

## Overview

The Terraform configuration consists of four files:

- `main.tf`: This file defines the `vcd_vm` module that creates "X" Number of Virtual Machines.
- `variables.tf`: This file defines the variables used in the `main.tf` file, such as the VCD Connection and the VDC Organization Details.
- `outputs.tf`: This file defines an `output` block that outputs the Virtual Machine Names, IPs, Computer Names, Metadata Entries, and the VM Sizing Policy for the VMs. 
- `providers.tf`: This file defines the `vcd` provider and specifies the connection details for VCD.

## Usage

To use this example Terraform configuration, follow these steps:

1. Install Terraform on your system.
2. Clone the `vmware-module-build-examples` repository.
3. Navigate to the `vcd_vm` directory.
4. Create a `secrets.auto.tfvars` file and fill in the required Connection and Organization values for your vCloud Director environment.
5. Run `terraform init` to initialize the Terraform configuration.
6. Run `terraform plan` to preview the changes that Terraform will make.
7. Run `terraform apply` to create the Virtual Machines.
8. When you are finished, run `terraform destroy` to destroy the Virtual Machines and clean up any resources that Terraform created.

## Contributing

If you have an example of how to use the `vcd` provider to create Virtual Machines in a different environment or with different settings, we welcome your contributions. Please fork this repository, create a new directory for your example, and submit a pull request.

## License

This directory is part of the VMware Module Build Examples repository, which is licensed under the MIT License. See the [LICENSE](../LICENSE) file for more information.