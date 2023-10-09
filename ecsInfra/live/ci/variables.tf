variable "vpc_id" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "ecs_security_group_id" {}
variable "alb_security_group_id" {}
variable "ecr_repository_url" {}
variable "ci_security_group_id" {}
variable "cpu" {}
variable "vpclink_id" {}
variable "memory" {}
variable "container_definitions" {}
variable "existing_execution_role_name" {}
variable "desired_count" {}
variable "mandatory_tags" {
  type = map(string)
}
variable "optional_tags" {
  type = map(string)
}


