
output "vpn_host" {
  value = {
    ipv4         = digitalocean_droplet.vpn.ipv4_address
    ipv4_private = digitalocean_droplet.vpn.ipv4_address_private
  }
}
