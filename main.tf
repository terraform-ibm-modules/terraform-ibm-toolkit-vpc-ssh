locals {
  name_prefix   = lower(replace(var.name_prefix != "" ? var.name_prefix : var.resource_group_name, "_", "-"))
  name          = var.name != "" ? var.name : "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-key"
  keys_provided = var.public_key != "" && var.private_key != ""
  public_key    = local.keys_provided ? var.public_key : tls_private_key.generated_key[0].public_key_openssh
  private_key   = local.keys_provided ? var.private_key : tls_private_key.generated_key[0].private_key_pem
}

resource tls_private_key generated_key {
  count = !local.keys_provided ? 1 : 0

  algorithm   = "RSA"
}

data ibm_resource_group resource_group {
  name = var.resource_group_name
}

resource ibm_is_ssh_key key {
  name = local.name

  public_key = local.public_key
}
