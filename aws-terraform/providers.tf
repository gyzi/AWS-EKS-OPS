terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "harshicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_profile
}




