locals {
  #name_prefix        = lower(replace(var.name_prefix != "" ? var.name_prefix : var.resource_group_name, "_", "-"))
  #name               = var.name != "" ? var.name : "${replace(local.name_prefix, "/[^a-zA-Z0-9_\\-\\.]/", "")}-${var.label}"

  prefix_name     = var.name_prefix != "" ? var.name_prefix : var.resource_group_name
  #name            = lower(replace("${local.prefix_name}-vpcssh-${var.label}", "_", "-"))
  name = var.name !=""

  keys_provided      = var.public_key != ""
  key_files_provided = var.public_key_file != "" && var.private_key_file != ""
  public_key         = var.public_key_file != "" ? file(var.public_key_file) : (local.keys_provided ? var.public_key : trimspace(tls_private_key.generated_key.public_key_openssh))
  private_key        = var.private_key_file != "" ? file(var.private_key_file) : (local.keys_provided ? var.private_key : trimspace(tls_private_key.generated_key.private_key_pem))
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
  algorithm = "RSA"
  rsa_bits  = var.rsa_bits
}

resource ibm_is_ssh_key key {
  name = local.name
  public_key = local.public_key
  resource_group = data.ibm_resource_group.resource_group.id
}
