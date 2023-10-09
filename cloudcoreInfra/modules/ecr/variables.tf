variable "ecr_repository_names" {
  description = "List of ECR repository names"
  type        = list(string)
}

variable "mandatory_tags" {
  description = "Mandatory tags that must be applied to the ECR repository"
  type        = map(string)
}

variable "optional_tags" {
  description = "Optional tags that can be applied to the ECR repository"
  default     = {}
  type        = map(string)
}
