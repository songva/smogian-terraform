resource "aws_vpc" "common_vpc" {
  cidr_block = "10.0.0.0/16"


  tags = {
    stage = terraform.workspace
    Name  = "vpc-${var.vpc_tag_name}"
  }
}

output "common_vpc_id" {
  value = aws_vpc.common_vpc.id
}