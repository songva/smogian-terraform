variable "queue_name" {
  description = "Name of the queue"
  type = string
}

variable "sqs_retention_seconds" {
  type = number
}

variable "queue_policy" {
  type = string
  default = "{}"
}