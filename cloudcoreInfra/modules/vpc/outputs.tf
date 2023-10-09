output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnet_1_id" {
  value = aws_subnet.private_subnet_1.id
}

output "private_subnet_2_id" {
  value = aws_subnet.private_subnet_2.id
}

/* output "security_group_id" {
  value = aws_security_group.allow_ecs.id
} */

output "main_route_table_id" {
  value = aws_vpc.main.default_route_table_id
}

output "cidr_block" {
  value = aws_vpc.main.cidr_block
}
