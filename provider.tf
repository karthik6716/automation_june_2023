terraform {
  required_version = ">1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.0.1"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }

  backend "s3" {
    role_arn     = "arn:aws:iam::035403326646:role/sts-assume-role"
    bucket         = "obl-1st-bucket"
    key            = "my-terraform-backendfiles"
    region         = "us-east-1"
    dynamodb_table = "terraform-statefiles-table"
  }

  # backend "s3" {
  #   bucket = terraform_state_file_storage_obl bucket should be preexisting 
  #   key    = "my-terraform-backendfiles"
  #   # region = "us-east-1"
  # role arn in case of sts token for user authentication
  # }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::035403326646:role/sts-assume-role"
    session_name = "terraform-token"
  }

}