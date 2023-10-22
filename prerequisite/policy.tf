data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "allow_access_from_terraform" {
  statement {
    principals {
      type        = "AWS"
      identifiers = [data.aws_caller_identity.current.account_id]
    }
    actions = [
      "s3:GetObject",
      "s3:ListBucket",
      "s3:PutObject",
      "s3:DeleteObject",
    ]
    effect = "Allow"
    resources = [
      aws_s3_bucket.terraform-state-bucket.arn,
      "${aws_s3_bucket.terraform-state-bucket.arn}/*",
    ]
  }
}
