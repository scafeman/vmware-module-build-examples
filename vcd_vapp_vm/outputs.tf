output "vm_names" {
  value = "${module.vapp_vm.vm_names}"
}

output "vm_computer_names" {
  value = "${module.vapp_vm.vm_computer_names}"
}

output "vm_metadata_os" {
  value = module.vapp_vm.vm_metadata_os
}

output "vm_metadata_version" {
  value = module.vapp_vm.vm_metadata_version
}

output "vm_metadata_cost_center" {
  value = module.vapp_vm.vm_metadata_cost_center
}

output "vm_sizing_policy_name" {
  value = module.vapp_vm.vm_sizing_policy_name
}

output "vm_networks" {
  value = "${module.vapp_vm.vm_networks}"
}
