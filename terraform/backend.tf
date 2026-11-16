terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "s3" {
    bucket               = "tfstate-957667616668-capstone3"
    key                  = "infra/terraform.tfstate"
    workspace_key_prefix = "env"
    region               = "ap-south-1"
    dynamodb_table       = "tf-locks-capstone3"
    encrypt              = true
  }
}
