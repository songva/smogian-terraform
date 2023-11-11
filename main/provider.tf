provider "aws" {
  shared_config_files = ["~/.aws/config"]
  profile             = terraform.workspace
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.21.0"
    }
  }
  required_version = ">= 1.6.1"

  backend "s3" {
    region               = "ca-central-1"
    bucket               = "smogian-terraform-backend"
    workspace_key_prefix = ""
    key                  = "terraform.tfstate"
  }
}
