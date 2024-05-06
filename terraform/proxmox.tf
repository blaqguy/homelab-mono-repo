resource "proxmox_virtual_environment_vm" "k8s-master" {
  name  = "k8s-master"
  vm_id = 100
  clone {
    vm_id = 7000
  }
  cpu {
    cores   = 2
    sockets = 1
  }
  memory {
    dedicated = 4096
  }
  disk {
    datastore_id = "local-lvm"
    interface    = "scsi0"
    size         = 30
  }
}
