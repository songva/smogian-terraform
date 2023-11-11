data "aws_iam_policy_document" "queue_user_register_input" {
  statement {
    sid    = "First"
    effect = "Allow"

    principals {
      type        = "*"
      identifiers = ["*"]
    }

    actions   = ["sqs:SendMessage"]
    resources = [module.sqs-user-register-input.queue-id]

  }
}