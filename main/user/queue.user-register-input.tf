module "sqs-user-register-input" {
  source = "../../modules/sqs"

  queue_name = "user-register-input"

  sqs_retention_seconds = var.sqs_retention_seconds

  queue_policy = data.aws_iam_policy_document.queue_user_register_input.json
}
