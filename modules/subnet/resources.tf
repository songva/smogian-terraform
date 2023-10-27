locals {
  public_subnets = tomap({
    for index, cidr in var.public_subnet_cidrs :
    cidr => var.available_zones[index]
  })
  private_subnets = tomap({
    for index, cidr in var.private_subnet_cidrs :
    cidr => var.available_zones[index]
  })
}

resource "aws_subnet" "public_subnet" {
  for_each = local.public_subnets

  cidr_block        = each.key
  availability_zone = each.value
  vpc_id            = var.vpc_id
  tags              = {
    name = "public-subnet-${each.value}"
  }
}

resource "aws_subnet" "private_subnet" {
  for_each = local.private_subnets

  cidr_block        = each.key
  availability_zone = each.value
  vpc_id            = var.vpc_id
  tags              = {
    name = "public-subnet-${each.value}"
  }
}