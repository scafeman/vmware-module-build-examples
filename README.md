# VMware Module Build Examples

This repository contains examples of how to use the `vcd` provider in Terraform to automate the deployment of Virtual Applications, Virtual Machines and Data Center Group Organization Networks into the Rackspace SDDC Flex VMware Cloud Director Platform.

## Overview

The repository contains two examples:

- `vcd_network_routed_v2`: This example demonstrates how to use the `vcd_network_routed_v2` Module to create a routed v2 network in VMware Cloud Director Environments.
- `vcd_vapp_vm`: This example demonstrates how to use the `vcd_vapp_vm` Module to create a vApp and Virtual Machines in VMware Cloud Director Environments.

Each example contains a `README.md` file that provides an overview of the Terraform configuration and instructions for using the configuration to deploy the resources.

## Usage

To use these example Terraform configurations, follow these steps:

1. Install Terraform on your system.
2. Clone the `vmware-module-build-examples` repository.
3. Navigate to the directory for the example you want to use (`vcd_network_routed_v2` or `vcd_vapp_vm`).
4. Follow the instructions in the `README.md` file for the example.

## Contributing

If you have an example of how to use the `vcd` provider to create a vApp and Virtual Machines in a different environment or with different settings, we welcome your contributions. Please fork this repository, create a new directory for your example, and submit a pull request.

## License

This repository is licensed under the MIT License. See the [LICENSE](./LICENSE) file for more information.