# Create the internal application load balancer (ALB) in the private subnets.
resource "aws_lb" "ecs_alb" {
  load_balancer_type = "application"
  internal           = true
  subnets            = var.private_subnet_ids
  security_groups    = [var.alb_security_group_id]
}

# Create the ALB target group for ECS.
resource "aws_lb_target_group" "alb_ecs_tg" {
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id
}

# Create the ALB listener with the target group.
resource "aws_lb_listener" "ecs_alb_listener" {
  load_balancer_arn = aws_lb.ecs_alb.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_ecs_tg.arn
  }
}
