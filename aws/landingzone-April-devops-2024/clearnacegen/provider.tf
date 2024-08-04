terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region     = "us-east-1"
  access_key = "access_key"
  secret_key = "secrete_key"
}