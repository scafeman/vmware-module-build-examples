#output "web_vm_info" {
#  value = [
#    for vm in module.vcd_vapp_web_vm.vm_info : {
#      name              = vm.name
#      ip                = vm.ip
#      computer_name     = vm.computer_name
#      metadata_entries  = { for entry in vm.metadata_entries : entry.key => entry.value }
#    }
#  ]
#}

#output "db_vm_info" {
#  value = [
#    for vm in module.vcd_vapp_db_vm.vm_info : {
#      name              = vm.name
#      ip                = vm.ip
#      computer_name     = vm.computer_name
#      metadata_entries  = { for entry in vm.metadata_entries : entry.key => entry.value }
#    }
#  ]
#}

output "web_all_vm_info" {
  value = [
    for vm in module.vcd_vapp_web_vm.all_vm_info : {
      name              = vm.name
      ip                = vm.ip
      computer_name     = vm.computer_name
      metadata_entries  = { for entry in vm.metadata_entries : entry.key => entry.value }
      sizing_policy     = vm.sizing_policy
    }
  ]
}

output "db_all_vm_info" {
  value = [
    for vm in module.vcd_vapp_db_vm.all_vm_info : {
      name              = vm.name
      ip                = vm.ip
      computer_name     = vm.computer_name
      metadata_entries  = { for entry in vm.metadata_entries : entry.key => entry.value }
      sizing_policy     = vm.sizing_policy
    }
  ]
}

output "vm_count" {
  value = module.vcd_vapp_web_vm.vm_count + module.vcd_vapp_db_vm.vm_count
}