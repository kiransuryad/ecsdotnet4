variable "vpc_id" {}

variable "private_subnet_ids" {
  type = list(string)
}

variable "ecs_security_group_id" {}

variable "alb_security_group_id" {}

variable "ecr_repository_url" {}

variable "ci_security_group_id" {}

variable "vpclink_id" {}

variable "existing_execution_role_name" {}

variable "mandatory_tags" {
  type = map(string)
}

variable "optional_tags" {
  type = map(string)
}

# Specific variables for the rater_service ECS module (ecs_rs)
variable "rs_desired_count" {}

variable "rs_ecr_repository_url" {}

variable "rs_cpu" {}

variable "rs_memory" {}

variable "rs_container_definitions" {}

# Listener ARN from ALB module
variable "alb_listener_arn" {}

# Specific variables for listener configuration in ecs_rs
variable "rater_service_listener_priority" {}

variable "rater_service_container_port" {}

# Similar sets of variables should be declared for the appetite_check service (ecs_ap)
variable "ap_desired_count" {}

variable "ap_ecr_repository_url" {}

variable "ap_cpu" {}

variable "ap_memory" {}

variable "ap_container_definitions" {}
variable "appetite_check_listener_priority" {}

variable "appetite_check_container_port" {}

variable "ecs_cluster_id" {}
