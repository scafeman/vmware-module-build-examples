output "vm_names" {
  value = "${module.vapp_vm.vm_names}"
}

output "vm_computer_names" {
  value = "${module.vapp_vm.vm_computer_names}"
}

output "vm_metadata_key_01" {
  value = module.vapp_vm.vm_metadata_key_01
}

output "vm_metadata_value_01" {
  value = module.vapp_vm.vm_metadata_value_01
}

output "vm_metadata_key_02" {
  value = module.vapp_vm.vm_metadata_key_02
}

output "vm_metadata_value_02" {
  value = module.vapp_vm.vm_metadata_value_02
}

output "vm_metadata_key_03" {
  value = module.vapp_vm.vm_metadata_key_03
}

output "vm_metadata_value_03" {
  value = module.vapp_vm.vm_metadata_value_03
}

output "vm_metadata_key_04" {
  value = module.vapp_vm.vm_metadata_key_04
}

output "vm_metadata_value_04" {
  value = module.vapp_vm.vm_metadata_value_04
}

output "vm_sizing_policy_name" {
  value = module.vapp_vm.vm_sizing_policy_name
}

output "vm_networks" {
  value = "${module.vapp_vm.vm_networks}"
}
