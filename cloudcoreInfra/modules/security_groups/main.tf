locals {
  common_tags = merge(var.mandatory_tags, var.optional_tags)
}

resource "aws_security_group" "TAL_raterservice_nonprod_ci_ecs_sg_01" {
  name        = "TAL-raterservice-nonprod-ci-ecs-sg-01"
  description = "Security Group for ECS Cluster"
  vpc_id      = var.vpc_id

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr] # Allow all traffic from the VPC
  }

  tags = local.common_tags
}

resource "aws_security_group_rule" "TAL_raterservice_nonprod_ci_ecs_ingress_01" {
  type                     = "ingress"
  description              = "ECS Ingress from ALB"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.TAL_raterservice_nonprod_ci_ecs_sg_01.id
  source_security_group_id = aws_security_group.TAL_raterservice_nonprod_ci_alb_sg_01.id
}

resource "aws_security_group" "TAL_raterservice_nonprod_ci_alb_sg_01" {
  name        = "TAL-raterservice-nonprod-ci-alb-sg-01"
  description = "Security Group for ALB"
  vpc_id      = var.vpc_id

  ingress {
    description = "ALB Ingress HTTP/HTTPS"
    from_port   = 80
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

resource "aws_security_group_rule" "TAL_raterservice_nonprod_ci_alb_egress_01" {
  type                     = "egress"
  description              = "ALB Egress to ECS"
  from_port                = 80
  to_port                  = 80
  protocol                 = "tcp"
  security_group_id        = aws_security_group.TAL_raterservice_nonprod_ci_alb_sg_01.id
  source_security_group_id = aws_security_group.TAL_raterservice_nonprod_ci_ecs_sg_01.id
}
