output "ecs_cluster_name" {
  value = module.ecs.ecs_cluster_name
}

output "apigw_endpoint" {
  value = module.api_gateway.apigw_endpoint
}

// Additional outputs relevant to the CI environment
