locals {
  queue_standard = [
    { name = "fila_1" },
    { name = "fila_2" },
    { name = "fila_3" }
  ]
  queue_dlq = [
    { name = "fila_1_dlq" },
    { name = "fila_2_dlq" },
    { name = "fila_3_dlq" }
  ]
}

resource "aws_sqs_queue" "terraform_queue" {
  count                     = length(local.queue_standard)
  name                      = local.queue_standard[count.index].name
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.terraform_queue_deadletter[count.index].arn
    maxReceiveCount     = 4
  })

  tags = {
    Environment = "production"
  }
}

resource "aws_sqs_queue" "terraform_queue_deadletter" {
  count                     = length(local.queue_dlq)
  name                      = local.queue_dlq[count.index].name
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "production"
  }
}
