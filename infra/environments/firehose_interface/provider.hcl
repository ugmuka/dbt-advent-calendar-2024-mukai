terraform {
  required_version = "~> 1.9.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.80.0"
    }
    snowflake = {
      source = "Snowflake-Labs/snowflake"
      version = "0.99.0"
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

provider "snowflake" {
  role          = "SYSADMIN"
  authenticator = "JWT"
}

provider "snowflake" {
  role          = "ACCOUNTADMIN"
  authenticator = "JWT"
  alias         = "accountadmin"
}


data "aws_caller_identity" "current" {}

data "aws_partition" "current" {}

data "aws_region" "current" {}
