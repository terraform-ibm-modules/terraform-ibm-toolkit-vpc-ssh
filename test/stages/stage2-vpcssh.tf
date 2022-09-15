module "vpc-ssh" {
  source = "./module"

  resource_group_name = module.resource_group.name
  #name_prefix         = local.nm_prefix
  name_prefix = var.name_prefix
  public_key          = var.public_key
  private_key         = var.private_key
}

resource null_resource write_keys {
  provisioner "local-exec" {
    command = "echo -n '${module.vpc-ssh.private_key}' > .private-key"
  }
  provisioner "local-exec" {
    command = "echo -n '${module.vpc-ssh.public_key}' > .public-key"
  }
}
