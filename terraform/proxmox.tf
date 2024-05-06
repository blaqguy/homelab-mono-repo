resource "proxmox_vm_qemu" "k8s-master" {
  name        = "k8s-master"
  desc        = "Kubernetes Master"
  vmid        = 100
  target_node = "hp-server01"
  agent       = 1
  clone       = "ubuntu-24-cloud-init"
  cores       = 2
  sockets     = 1
  memory      = 4096
  disk {
    size    = "30G"
    storage = "local-lvm"
    type    = "scsi"
  }
}

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
