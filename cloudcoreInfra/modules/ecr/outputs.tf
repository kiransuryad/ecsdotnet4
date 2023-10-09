output "ecr_repository_urls" {
  value = [for repo in aws_ecr_repository.this : repo.repository_url]
}

