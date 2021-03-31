output "id" {
  description = "The id of the ssh key"
  value       = ibm_is_ssh_key.key.id
}

output "public_key" {
  description = "The public key value"
  value       = local.public_key
  depends_on  = [ibm_is_ssh_key.key]
}

output "private_key" {
  description = "The private key value"
  value       = local.private_key
  depends_on  = [ibm_is_ssh_key.key]
  sensitive   = true
}
