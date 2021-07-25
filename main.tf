terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    random = {
      source = "hashicorp/random"
    }
    template = {
      source = "hashicorp/template"
    }
  }
  required_version = ">= 0.13"
}

data "digitalocean_vpc" "vpc" {
  name = var.vpc_name
}

data "template_file" "user_data" {
  template = file("${path.module}/vpn-cloud-init.yaml")
  vars = {
    enable_provision  = var.auto_config_node
    vpn_name          = var.vpn_name
    pre_shared_key    = var.vpn_pre_shared_key
    phase1_encryption = var.vpn_phase1_encryption
    phase2_encryption = var.vpn_phase2_encryption
    local_id          = var.vpn_local_id
    remote_id         = var.vpn_remote_id
    remote_subnet     = var.vpn_remote_subnet
  }
}

resource "digitalocean_droplet" "vpn" {
  image      = var.do_droplet_image
  name       = var.vpn_hostname
  region     = data.digitalocean_vpc.vpc.region
  size       = var.do_droplet_size
  ssh_keys   = var.authorized_ssh_keys
  monitoring = true
  vpc_uuid   = data.digitalocean_vpc.vpc.id
  user_data  = data.template_file.user_data.rendered
}

