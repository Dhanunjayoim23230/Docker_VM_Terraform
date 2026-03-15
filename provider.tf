terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.30.0"
    }
  }
  backend "s3" {
    bucket         = "vrushali-tf-state-file"
    key            = "DocketFiles"
    region         = "us-east-1"
    dynamodb_table = "vrusali-state-lock-file"
  }
}

provider "aws" {

  # Configuration options
  region = "us-east-1"
}