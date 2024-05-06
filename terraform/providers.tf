terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.43.2"
    }
  }
}

provider "proxmox" {
  endpoint  = "https://192.168.1.13:8006/api2/json"
  api_token = "terraform@pam!terraform=87d1f3c8-ef42-430a-905c-821dccc6b709"
  insecure  = true
  ssh {
    agent    = true
    username = "terraform"
  }
}
