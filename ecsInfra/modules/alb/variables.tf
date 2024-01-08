variable "vpc_id" {
  description = "The VPC ID where the ECS cluster will be deployed."
  type        = string
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for launching ECS tasks."
  type        = list(string)
}

variable "ecs_security_group_id" {
  description = "The Security Group ID to attach to the ECS service."
  type        = string
}

variable "ci_security_group_id" {
  description = "The Security Group ID to attach to the ECS service."
  type        = string
}

variable "alb_security_group_id" {
  description = "The Security Group ID to attach to the ALB."
  type        = string
}


variable "mandatory_tags" {
  description = "Mandatory tags for resources."
  type        = map(string)
  default     = {}
}

variable "optional_tags" {
  description = "Optional tags for resources."
  type        = map(string)
  default     = {}
}

variable "existing_execution_role_name" {
  description = "The name of the existing ECS execution role."
  type        = string
}
