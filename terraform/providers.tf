terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

provider "proxmox" {
  pm_api_token_secret = "87d1f3c8-ef42-430a-905c-821dccc6b709"
  pm_api_token_id = "terraform@pam!terraform"
  pm_api_url = "https://192.168.1.13:8006/api2/json"
}
