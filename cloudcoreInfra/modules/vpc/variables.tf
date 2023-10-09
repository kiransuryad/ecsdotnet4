variable "aws_region" {
  description = "AWS region"
}

variable "cidr_block" {
  description = "CIDR block for the VPC"
}

variable "private_subnet_1_cidr" {
  description = "CIDR block for the first private subnet"
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for the second private subnet"
}
