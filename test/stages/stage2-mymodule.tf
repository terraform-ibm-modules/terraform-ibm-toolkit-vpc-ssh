module "vpc-ssh" {
  source = "./module"

  resource_group_name = var.resource_group_name
  region              = var.region
  ibmcloud_api_key    = var.ibmcloud_api_key
  name_prefix         = var.name_prefix
}
