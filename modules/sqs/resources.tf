module "constants" {
  source = "../constants"
}

locals {
  queue_id = "${terraform.workspace}-${module.constants.application-name}-${var.queue_name}"
}

resource "aws_sqs_queue" "common_queue" {
  name                      = "${local.queue_id}-queue"
  message_retention_seconds = var.sqs_retention_seconds
  tags                      = {
    stage = terraform.workspace
  }
}

resource "aws_sqs_queue" "dead_letter_queue" {
  name                      = "${local.queue_id}-dlq-queue"
  message_retention_seconds = var.sqs_retention_seconds
  redrive_allow_policy      = jsonencode({
    redrivePermission = "byQueue",
    sourceQueueArns   = [aws_sqs_queue.common_queue.arn]
  })
  tags = {
    stage = terraform.workspace
  }
}

resource "aws_sqs_queue_redrive_policy" "common_queue_redrive_allow_policy" {
  queue_url      = "${local.queue_id}-queue"
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.dead_letter_queue.arn,
    maxReceiveCount     = 4
  })
}

resource "aws_sqs_queue_policy" "common_queue_policy" {
  queue_url = "${local.queue_id}-queue"
  policy    = var.queue_policy
}

output "queue-id" {
  value = aws_sqs_queue.common_queue.id
}