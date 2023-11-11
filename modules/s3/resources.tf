module "constants" {
	source = "../constants"
}

resource "aws_s3_bucket" "common-bucket" {
	bucket = "${terraform.workspace}-${module.constants.application-name}-${var.bucket_id}"

	tags = {
		stage = terraform.workspace
	}
}