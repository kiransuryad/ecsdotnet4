output "aurora_cluster_id" {
  value       = aws_rds_cluster.aurora_cluster.id
  description = "The ID of the Aurora cluster"
}

output "aurora_cluster_endpoints" {
  value = {
    reader_endpoint = aws_rds_cluster.aurora_cluster.reader_endpoint
    writer_endpoint = aws_rds_cluster.aurora_cluster.endpoint
  }
  description = "The reader and writer endpoints of the Aurora cluster"
}

output "aurora_instance_ids" {
  value       = aws_rds_cluster_instance.aurora_cluster_instances.*.id
  description = "The IDs of the Aurora cluster instances"
}
