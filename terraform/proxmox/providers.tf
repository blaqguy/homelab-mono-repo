terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {}

terraform {
  cloud {
    organization = "emeka-homelab"

    workspaces {
      name = "default"
    }
  }
}
