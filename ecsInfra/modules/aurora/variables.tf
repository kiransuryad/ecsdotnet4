variable "cluster_name" {
  type        = string
  description = "The name of the Aurora cluster"
}

variable "engine_version" {
  type        = string
  description = "The engine version for the Aurora cluster"
}

variable "instance_type" {
  type        = string
  description = "The instance type for the Aurora cluster instances"
}

variable "username" {
  type        = string
  description = "Username for the master DB user"
}

variable "password" {
  type        = string
  description = "Password for the master DB user"
}

variable "vpc_security_group_ids" {
  type        = list(string)
  description = "List of VPC security group IDs to associate"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the DB subnet group"
}
