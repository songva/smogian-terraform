resource "aws_s3_bucket" "common-bucket" {
	bucket = var.bucket_id

	tags = {
		stage = terraform.workspace
	}
}