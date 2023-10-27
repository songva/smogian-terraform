terraform {
  backend "local" {
    workspace_dir = "terraform.tfstate"
  }
}

resource "aws_s3_bucket" "terraform-state-bucket" {
  bucket = "smogian-terraform-backend"
}

resource "aws_s3_bucket_policy" "allow_access_from_terraform" {
  bucket = aws_s3_bucket.terraform-state-bucket.id
  policy = data.aws_iam_policy_document.allow_access_from_terraform.json
}

resource "aws_s3_bucket_versioning" "terraform-state-versioning" {
  bucket = aws_s3_bucket.terraform-state-bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}