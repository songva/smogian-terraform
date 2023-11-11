module "bucket-order" {
  source = "../../modules/s3"

  bucket_id = "orders"
}