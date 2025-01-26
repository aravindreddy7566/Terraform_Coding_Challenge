provider "aws" {
  region = var.aws_region
}

terraform {
  required_version = "<= 1.10.4"
  required_providers {
    aws = {
      version = "<= 6.0.0"
      source  = "hashicorp/aws"
    }
  }
}