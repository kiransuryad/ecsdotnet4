output "vpc_endpoint_ids" {
  value = { for k, v in aws_vpc_endpoint.interface_endpoints : k => v.id }
}

/* output "ecs_vpc_endpoint_id" {
  value = aws_vpc_endpoint.interface_endpoints["ecs"].id
} */

output "ecr_dkr_vpc_endpoint_id" {
  value = aws_vpc_endpoint.interface_endpoints["ecr.dkr"].id
}

output "ecr_api_vpc_endpoint_id" {
  value = aws_vpc_endpoint.interface_endpoints["ecr.api"].id
}

output "logs_vpc_endpoint_id" {
  value = aws_vpc_endpoint.interface_endpoints["logs"].id
}

output "s3_vpc_endpoint_id" {
  value = aws_vpc_endpoint.s3.id
}

output "vpclink_id" {
  value = aws_apigatewayv2_vpc_link.vpclink_apigw_to_alb.id
}

/* output "dynamodb_vpc_endpoint_id" {
  value = aws_vpc_endpoint.dynamodb.id
}
 */
