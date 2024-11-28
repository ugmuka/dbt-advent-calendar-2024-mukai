terraform {
  required_version = "~> 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.30.0"
    }
  }
}

provider "aws" {
  region = local.aws_region

  default_tags {
    tags = {
      Environment = "dev"
    }
  }
}

data "aws_caller_identity" "current" {}
