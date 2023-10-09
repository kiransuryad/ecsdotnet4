output "ecs_cluster_name" {
  description = "The name of the ECS cluster."
  value       = aws_ecs_cluster.ecs_cluster.name
}

output "ecs_task_definition_arn" {
  description = "The ARN of the ECS task definition."
  value       = aws_ecs_task_definition.ecs_task_definition.arn
}

output "ecs_service_name" {
  description = "The name of the ECS service."
  value       = aws_ecs_service.ecs_service.name
}
