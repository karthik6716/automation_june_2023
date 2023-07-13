variable "region" {
  description = "region for aws deployment"
  type        = string
  default     = "value"

}
variable "cidr_for_vpc" {
  description = "cidr range for vpc"
  type        = string
  # default     = "10.0.0.0/24"
}

variable "tenancy" {
  description = "instance tenancy for instances launched in this vpc"
  type        = string
  default     = "default"
}

variable "dns_hostnames_enabled" {
  description = "a boolean flag to enable/disable DNS hostname in the vpc "
  type        = bool
  default     = true
}

variable "dns_support_enabled" {
  description = "a boolean flag to enable/disable DNS support in the vpc "
  type        = bool
  default     = true
}

variable "assign_generated_ipv6_cidr_block" {
  description = "Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC "
  type        = bool
  default     = false
}

variable "vpc_name" {
  description = "name for vpc"
  type        = string
  # default     = "test-terraform-vpc"

}

variable "aws_s3_bucket_name" {
  description = "name for s3-bucket"
  type        = string
  # default     = "terraform-state-file-bucket"
}


variable "aws_s3_bucket_versioning" {
  description = "versioning for s3 bucket"
  type        = string
}

variable "web_server_name" {
  description = "name for web-server"
  type        = string
}

variable "bastion_host_name" {
  description = "name for bastion_host"
  type        = string
}

variable "key_pair" {
  description = "key pair created to ssh into instances"
  type        = string
}




# variable "inbound_rules_web" {
#   description = "ingress rules for security groups for web servers"
#   type = list(object({
#     port        = number
#     description = string
#     protocol    = string
#     # cidr_range = list(string) in case we are provided a cidr ranges that will be referenced in default value and give it the list of value s
#   }))
#   default = [{
#     description = "inbound rule for ssh"
#     protocol    = "string"
#     port        = 22
#     },
#     {
#       description = "inbound rule for http"
#       protocol    = "string"
#       port        = 80
#   }]
# }

variable "key_name" {
  description = "key_pair name for instances"
  type        = string
  default     = "mykey"
}


