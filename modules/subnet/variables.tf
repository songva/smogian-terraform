variable "vpc_id" {
  description = "id of vpc in which subnets are gonna be created "
  type = string
}

variable "public_subnet_cidrs" {
  description = "list of cidr for public subnet"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "list of cidr for private subnet"
  type        = list(string)
}

variable "available_zones" {
  description = "list of available zones for subnets"
  type        = list(string)
}
