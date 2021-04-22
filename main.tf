locals {
  name_prefix   = lower(replace(var.name_prefix != "" ? var.name_prefix : var.resource_group_name, "_", "-"))
  name          = var.name != "" ? var.name : "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-${var.label}"
  keys_provided = var.public_key != "" && var.private_key != ""
  public_key    = local.keys_provided ? var.public_key : tls_private_key.generated_key[0].public_key_openssh
  public_key_pem = local.keys_provided ? var.public_key : tls_private_key.generated_key[0].public_key_pem
  private_key   = local.keys_provided ? var.private_key : tls_private_key.generated_key[0].private_key_pem
}

resource null_resource print_names {
  provisioner "local-exec" {
    command = "echo 'Resource group: ${var.resource_group_name}'"
  }
}

data ibm_resource_group resource_group {
  depends_on = [null_resource.print_names]

  name = var.resource_group_name
}

resource tls_private_key generated_key {
  count = !local.keys_provided ? 1 : 0

  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}

resource ibm_is_ssh_key key {
  name = local.name

  public_key = local.public_key
}
