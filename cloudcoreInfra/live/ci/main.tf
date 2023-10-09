terraform {
  backend "s3" {
    bucket = "test-3434546456699"
    key    = "ci-infra/terraform.tfstate"
    region = "us-east-1"
  }
}


module "vpc" {
  source     = "../../modules/vpc"
  aws_region = var.aws_region

  cidr_block            = "10.0.0.0/16"
  private_subnet_1_cidr = "10.0.1.0/24"
  private_subnet_2_cidr = "10.0.2.0/24"
}

module "vpc_endpoints" {
  source                     = "../../modules/vpc_endpoints"
  vpc_id                     = module.vpc.vpc_id
  aws_region                 = var.aws_region
  ecs_security_group_id      = module.security_groups.TAL_raterservice_nonprod_ci_ecs_sg_01_id
  alb_security_group_id      = module.security_groups.TAL_raterservice_nonprod_ci_alb_sg_01_id
  endpoint_security_group_id = module.security_groups.TAL_raterservice_nonprod_ci_ecs_sg_01_id
  private_subnet_ids         = [module.vpc.private_subnet_1_id, module.vpc.private_subnet_2_id]
  route_table_id             = module.vpc.main_route_table_id
  security_group_id          = module.security_groups.TAL_raterservice_nonprod_ci_ecs_sg_01_id

  mandatory_tags = {
    "Environment" = "CI"
    "Owner"       = "DevOps Team"
  }
  optional_tags = {
    "Application" = "My .NET App"
  }
}


module "ecr" {
  source = "../../modules/ecr"

  ecr_repository_names = ["my-dotnet-app", "debug-sidecar"]

  mandatory_tags = {
    "Environment" = "CI"
    "Owner"       = "DevOps Team"
  }
  optional_tags = {
    "Application" = "My .NET App"
  }
}

module "security_groups" {
  source   = "../../modules/security_groups"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = module.vpc.cidr_block

  mandatory_tags = {
    "Environment" = "CI"
    "Owner"       = "DevOps Team"
  }
  optional_tags = {
    "Application" = "My .NET App"
  }
}
