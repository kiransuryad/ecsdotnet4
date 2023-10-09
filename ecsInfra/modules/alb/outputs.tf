output "alb_listener_arn" {
  description = "The ALB Listener ARN"
  value       = aws_lb_listener.ecs_alb_listener.arn
}

output "aws_lb_target_group_arn" {
  description = "The ALB target group"
  value       = aws_lb_target_group.alb_ecs_tg.arn
}

