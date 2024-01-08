# variables.tf

variable "existing_execution_role_name" {
  type        = string
  description = "Name of the existing IAM role for ECS execution"
}

variable "ecs_cluster_id" {
  type        = string
  description = "ID of the existing ECS cluster"
}

variable "appetite_check_cpu" {
  type        = string
  description = "CPU units for the 'appetite_check' task"
}

variable "appetite_check_memory" {
  type        = string
  description = "Memory for the 'appetite_check' task"
}

variable "appetite_check_container_definitions" {
  type        = string
  description = "Container definitions for 'appetite_check' in JSON format"
}

variable "appetite_check_desired_count" {
  type        = number
  description = "Desired number of instances for the 'appetite_check' service"
}

variable "appetite_check_container_port" {
  type        = number
  description = "Container port for 'appetite_check'"
  default     = 80
}

variable "appetite_check_security_group_id" {
  type        = string
  description = "Security group ID for the 'appetite_check' service"
}

variable "private_subnet_ids" {
  type        = list(string)
  description = "List of private subnet IDs for the ECS services"
}

variable "mandatory_tags" {
  type        = map(string)
  description = "Mandatory tags for all resources"
  default     = {}
}

variable "optional_tags" {
  type        = map(string)
  description = "Optional tags for all resources"
  default     = {}
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where the target group is created"
}

variable "alb_listener_arn" {
  type        = string
  description = "ARN of the ALB listener for routing traffic"
}

variable "appetite_check_listener_priority" {
  type        = number
  description = "Priority for the ALB listener rule for 'appetite_check'"
  default     = 102
}

variable "appetite_check_path_pattern" {
  type        = string
  description = "Path pattern for routing traffic to 'appetite_check'"
  default     = "/ci/appetite-check*"
}
