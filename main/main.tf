module "user-register-module" {
  source = "./user"
  sqs_retention_seconds = var.sqs_retention_seconds
}

module "common-configurations" {
  source = "./common"
}