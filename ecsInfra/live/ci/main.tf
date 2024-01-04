provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "test-3434546456699"
    key    = "ci-app-2/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_cloudwatch_log_group" "my_log_group" {
  name = "my-log-group"
}

resource "aws_cloudwatch_log_group" "my_sidecar_log_group" {
  name = "my-sidecar-log-group"
}


module "alb" {
  source                       = "../../modules/alb"
  vpc_id                       = var.vpc_id
  private_subnet_ids           = var.private_subnet_ids
  ecs_security_group_id        = var.ecs_security_group_id
  alb_security_group_id        = var.alb_security_group_id
  ci_security_group_id         = var.ci_security_group_id
  desired_count                = var.desired_count
  existing_execution_role_name = var.existing_execution_role_name
  ecr_repository_url           = var.ecr_repository_url
  cpu                          = var.cpu
  memory                       = var.memory
  container_definitions        = var.container_definitions
  mandatory_tags               = var.mandatory_tags
  optional_tags                = var.optional_tags

}


module "ecs" {
  source                       = "../../modules/ecs"
  vpc_id                       = var.vpc_id
  private_subnet_ids           = var.private_subnet_ids
  ecs_security_group_id        = var.ecs_security_group_id
  alb_security_group_id        = var.alb_security_group_id
  ci_security_group_id         = var.ci_security_group_id
  desired_count                = var.desired_count
  existing_execution_role_name = var.existing_execution_role_name
  ecr_repository_url           = var.ecr_repository_url
  cpu                          = var.cpu
  memory                       = var.memory
  container_definitions        = var.container_definitions
  mandatory_tags               = var.mandatory_tags
  optional_tags                = var.optional_tags
  aws_lb_target_group_arn      = module.alb.aws_lb_target_group_arn
}


module "api_gateway" {
  source                       = "../../modules/api_gateway"
  vpc_id                       = var.vpc_id
  private_subnet_ids           = var.private_subnet_ids
  ecs_security_group_id        = var.ecs_security_group_id
  alb_security_group_id        = var.alb_security_group_id
  ci_security_group_id         = var.ci_security_group_id
  desired_count                = var.desired_count
  existing_execution_role_name = var.existing_execution_role_name
  ecr_repository_url           = var.ecr_repository_url
  cpu                          = var.cpu
  memory                       = var.memory
  container_definitions        = var.container_definitions
  mandatory_tags               = var.mandatory_tags
  optional_tags                = var.optional_tags
  vpclink_id                   = var.vpclink_id
  alb_listener_arn             = module.alb.alb_listener_arn
}


module "aurora" {
  source = "../../modules/aurora"

  cluster_name           = "nonprod-postgressql-aurora"
  engine_version         = "latest_postgres_version"
  instance_type          = "db.r5.large"
  username               = "admin"
  password               = "admin"
  vpc_security_group_ids = ["sg-xxxxxxxxxxxxxxxxx"]
  subnet_ids             = ["subnet-xxxxxxxx", "subnet-yyyyyyyy"]
}
