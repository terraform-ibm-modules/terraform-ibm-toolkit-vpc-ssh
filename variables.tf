
variable "resource_group_name" {
  type        = string
  description = "Name of resource group in which to create the ssh key instance. "
}

variable "region" {
  type        = string
  description = "Region"
}

variable "ibmcloud_api_key" {
  type        = string
  description = "The IBM Cloud api key used to provision the IBM Cloud resources"
}

variable "name_prefix" {
  type        = string
  description = "(Optional) Prefix used to name all resources. If not provided then resource_group_name is used."
  default     = ""
}

variable "name" {
  type        = string
  description = "(Optional) Name given to the ssh key instance. If not provided it will be generated using prefix_name"
  default     = ""
}

variable "label" {
  type        = string
  description = "(Optional) Label used for the instance. It will be added to the name_prefix to create the name if the name is not provided."
  default     = "sshkey"
}

variable "public_key" {
  type        = string
  description = "The public key provided for the ssh key. If empty string is provided then a new key will be generated."
}

variable "private_key" {
  type        = string
  description = "The private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "public_key_file" {
  type        = string
  description = "The name of the file containing the public key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "private_key_file" {
  type        = string
  description = "The name of the file containing the private key provided for the ssh key. If empty string is provided then a new key will be generated."
  default     = ""
}

variable "rsa_bits" {
  type        = number
  description = "The number of bits for the rsa key, if it will be generated"
  default     = 3072
}
