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
    bucket         = "obl-1st-bucket"
    key            = "my-terraform-backendfiles"
    region         = "us-east-1"
    access_key     = "AKIAQQPRT4S3KK23FCRV"
    secret_key     = "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"
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
  region     = "us-east-1"
  access_key = "AKIAQQPRT4S3KK23FCRV"
  secret_key = "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"
}