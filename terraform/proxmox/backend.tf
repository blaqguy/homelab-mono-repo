terraform {
  cloud {
    organization = "emeka-homelab"

    workspaces {
      name = "default"
    }
  }
}
