module "s3" {
  source = "../modules/s3"

  bucket_id = "${terraform.workspace}-${module.constants.application-name}-orders"
}