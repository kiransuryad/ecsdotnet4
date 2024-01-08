# main.tf

# Data source to fetch the existing IAM role
data "aws_iam_role" "existing_ecs_execution_role" {
  name = var.existing_execution_role_name
}

# Task Definition for the 'appetite_check' microservice
resource "aws_ecs_task_definition" "appetite_check_task" {
  family                   = "appetite_check_task_family"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.appetite_check_cpu
  memory                   = var.appetite_check_memory
  execution_role_arn       = data.aws_iam_role.existing_ecs_execution_role.arn
  container_definitions    = var.appetite_check_container_definitions
  tags = merge(
    var.mandatory_tags,
    var.optional_tags
  )
}

# ECS Service for the 'appetite_check' microservice
resource "aws_ecs_service" "appetite_check_service" {
  name            = "appetite_check_service"
  cluster         = var.ecs_cluster_id
  task_definition = aws_ecs_task_definition.appetite_check_task.arn
  desired_count   = var.appetite_check_desired_count
  launch_type     = "FARGATE"

  load_balancer {
    target_group_arn = aws_lb_target_group.appetite_check_tg.arn
    container_name   = "appetite_check_container"
    container_port   = var.appetite_check_container_port
  }

  network_configuration {
    subnets         = var.private_subnet_ids
    security_groups = [var.appetite_check_security_group_id]
  }

  tags = merge(
    var.mandatory_tags,
    var.optional_tags
  )
}

# Target Group for 'appetite_check' microservice
resource "aws_lb_target_group" "appetite_check_tg" {
  name     = "appetite-check-tg"
  port     = var.appetite_check_container_port
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    path                = "/health"
    interval            = 30
    matcher             = "200"
  }

  tags = merge(
    var.mandatory_tags,
    var.optional_tags
  )
}

# Listener Rule for the Application Load Balancer to route 'appetite_check' traffic
resource "aws_lb_listener_rule" "appetite_check_rule" {
  listener_arn = var.alb_listener_arn
  priority     = var.appetite_check_listener_priority

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.appetite_check_tg.arn
  }

  condition {
    path_pattern {
      values = [var.appetite_check_path_pattern]
    }
  }
}
