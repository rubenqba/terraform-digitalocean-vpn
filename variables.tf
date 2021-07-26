
variable "authorized_ssh_keys" {
  type        = list(any)
  description = "SSH id list for authorized users"
  default     = []
}

variable "auto_config_node" {
  type        = bool
  description = "Automatic provisioning of the node"
  default     = true
}


variable "do_droplet_image" {
  description = "Image to create droplet"
  default     = "ubuntu-20-04-x64"
}

variable "do_droplet_size" {
  type        = string
  description = "Droplet size (computer power)"
  default     = "s-1vcpu-1gb"
}

variable "vpc_name" {
  type        = string
  description = "VPN internal VPC name"
}

variable "vpn_name" {
  type        = string
  description = "VPN name identifier"
}

variable "vpn_hostname" {
  type        = string
  description = "VPN node hostname"
  default     = "vpn-server"
}

variable "vpn_pre_shared_key" {
  type        = string
  description = "VPN Pre-Shared Key"
  default     = "vpn-server"
}

variable "vpn_phase1_encryption" {
  type        = string
  description = "VPN Phase 1 Algorithms configuration "
  default     = "ike=aes256-sha256-modp1024-modp2048!"
}

variable "vpn_phase2_encryption" {
  type        = string
  description = "VPN Phase 2 Algorithms configuration "
  default     = "esp=aes256-sha256-modp1024-modp2048!"
}

variable "vpn_local_id" {
  type        = string
  description = "VPN Local (Left) ID"
  default     = "VPN_GYFTED"
}

variable "vpn_remote_id" {
  type        = string
  description = "VPN Remote (Right) ID"
}

variable "vpn_remote_address" {
  type        = string
  description = "VPN Remote (Right) Public address, not used if auto_config_node=false"
  default     = ""
}

variable "vpn_remote_subnet" {
  type        = string
  description = "VPN Remote (Right) Subnet"
}

variable "webhooks_endpoint" {
  type        = string
  description = "Webhooks endpoint fqdn, not used if auto_config_node"
  default     = ""
}

variable "webhooks_port" {
  type        = string
  description = "Webhooks endpoint port"
  default     = "443"
}
