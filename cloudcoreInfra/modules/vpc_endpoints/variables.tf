variable "vpc_id" {
  description = "VPC ID where endpoints should be created"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "security_group_id" {
  description = "Security Group ID for Interface type VPC endpoints"
}

variable "mandatory_tags" {
  description = "Mandatory tags that must be applied to the VPC endpoints"
  type        = map(string)
}

variable "optional_tags" {
  description = "Optional tags that can be applied to the VPC endpoints"
  default     = {}
  type        = map(string)
}

variable "ecs_security_group_id" {
  description = "Security group ID for ECS"
}

variable "alb_security_group_id" {
  description = "Security group ID for ALB"
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs to associate with the VPC endpoints"
  type        = list(string)
}

variable "route_table_id" {
  description = "Route table ID to associate with the S3 gateway endpoint"
}

variable "endpoint_security_group_id" {
  description = "Security group ID specific to VPC endpoints"
  type        = string
}
