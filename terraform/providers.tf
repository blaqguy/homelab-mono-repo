terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
  cloud {
    organization = "emeka-homelab"

    workspaces {
      name = "default"
    }
  }  
}

provider "proxmox" {}
