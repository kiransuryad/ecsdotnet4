# outputs.tf

output "appetite_check_service_id" {
  value       = aws_ecs_service.appetite_check_service.id
  description = "ID of the 'appetite_check' ECS service"
}

output "appetite_check_task_definition_arn" {
  value       = aws_ecs_task_definition.appetite_check_task.arn
  description = "ARN of the 'appetite_check' task definition"
}

output "appetite_check_target_group_arn" {
  value       = aws_lb_target_group.appetite_check_tg.arn
  description = "ARN of the 'appetite_check' target group"
}
