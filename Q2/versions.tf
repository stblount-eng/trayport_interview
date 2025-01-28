terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  #   # I'm assuming we're using an S3 backend and that it has already been created
  #   backend "s3" {
  #     bucket         = "my-terraform-state-bucket"
  #     key            = "s3-buckets/terraform.tfstate"
  #     region         = "us-west-2"
  #     encrypt        = true
  #     dynamodb_table = "terraform-state-lock"
  #   }
}

provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      ManagedBy = "Terraform"
      Project   = "TrayportInterview"
    }
  }
}
