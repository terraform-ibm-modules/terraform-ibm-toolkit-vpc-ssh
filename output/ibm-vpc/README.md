
# IBM VPC module

Provisions the IBM Cloud VPC instance with network acls



## Software dependencies

The module depends on the following software components:

### Terraform version

- \>= v0.15

### Terraform providers

- ibm (ibm-cloud/ibm)

### Module dependencies

- resource_group - github.com/terraform-ibm-modules/terraform-ibm-toolkit-resource-group (>= 2.1.0)

## Module details

### Inputs

| Name | Description | Required | Default | Source |
|------|-------------|---------|----------|--------|
| resource_group_name | The name of the IBM Cloud resource group where the VPC instance will be created. | true |  | resource_group.name |
| region | The IBM Cloud region where the cluster will be/has been installed. | true |  |  |
| name | The name of the vpc instance | true |  |  |
| name_prefix | The name of the vpc resource | true |  |  |
| provision | Flag indicating that the instance should be provisioned. If false then an existing instance will be looked up |  | true |  |
| address_prefix_count | The number of ipv4_cidr_blocks |  | 0 |  |
| address_prefixes | List of ipv4 cidr blocks for the address prefixes (e.g. ['10.10.10.0/24']). If you are providing cidr blocks then a value must be provided for each of the subnets. If you don't provide cidr blocks for each of the subnets then values will be generated using the {ipv4_address_count} value. |  |  |  |
| base_security_group_name | The name of the base security group. If not provided the name will be based on the vpc name | true |  |  |
| internal_cidr | The cidr range of the internal network |  | 10.0.0.0/8 |  |
| tags | Tags that should be added to the instance |  |  |  |
| common_tags | Common tags that should be added to the instance |  |  |  |


### Outputs

| Name | Description |
|------|-------------|
| name | The name of the vpc instance |
| id | The id of the vpc instance |
| acl_id | The id of the network acl |
| crn | The CRN for the vpc instance |
| count | The number of VPCs created by this module. Always set to 1 |
| names | The name of the vpc instance |
| ids | The id of the vpc instance |
| base_security_group | The id of the base security group to be shared by other resources. The base group is different from the default security group. |
| addresses | The ip address ranges for the VPC |

