provider "aws" {
  shared_config_files = ["~/.aws/config"]
  profile             = terraform.workspace
}