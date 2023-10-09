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

variable "ecr_repository_url" {
  description = "The URL for the ECR repository that contains the Docker image."
  type        = string
}

variable "cpu" {
  description = "The CPU value for the ECS task."
  type        = string
}

variable "memory" {
  description = "The memory value for the ECS task."
  type        = string
}

variable "container_definitions" {
  description = "The container definitions in JSON format."
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

variable "desired_count" {
  description = "The number of instances of the task definition to place and keep running."
  type        = number
}

variable "aws_lb_target_group_arn" {
  description = "The ALB target group ARN"
  type        = string
  default     = "arn:aws:elasticloadbalancing:us-east-1:950529178389:targetgroup/tf-20231004181002229300000001/732e5dccab80ac95"
}
