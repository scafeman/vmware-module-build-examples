output "web_vm_info" {
  value = [
    for vm in module.vcd_vapp_web_vm.vm_info : {
      name              = vm.name
      ip                = vm.ip
      computer_name     = vm.computer_name
      metadata_entries = { for entry in vm.metadata_entries : entry.key => entry.value }
    }
  ]
}

output "web_db_info" {
  value = [
    for vm in module.vcd_vapp_web_db.vm_info : {
      name              = vm.name
      ip                = vm.ip
      computer_name     = vm.computer_name
      metadata_entries = { for entry in vm.metadata_entries : entry.key => entry.value }
    }
  ]
}