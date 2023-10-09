variable "vpc_id" {
  description = "VPC ID where security groups should be created"
  type        = string
}

variable "mandatory_tags" {
  description = "Mandatory tags to apply to the security groups"
  type        = map(string)
}

variable "optional_tags" {
  description = "Optional tags to apply to the security groups"
  default     = {}
  type        = map(string)
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  type        = string
}
