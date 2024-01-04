resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier     = var.cluster_name
  engine                 = "aurora-postgresql"
  engine_version         = var.engine_version
  db_subnet_group_name   = aws_db_subnet_group.aurora_subnet_group.name
  vpc_security_group_ids = var.vpc_security_group_ids
  master_username        = var.username
  master_password        = var.password
  skip_final_snapshot    = true
}

resource "aws_db_subnet_group" "aurora_subnet_group" {
  name       = "${var.cluster_name}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_rds_cluster_instance" "aurora_cluster_instances" {
  count              = 2
  identifier         = "${var.cluster_name}-${count.index}"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = var.instance_type
  engine             = aws_rds_cluster.aurora_cluster.engine
  engine_version     = aws_rds_cluster.aurora_cluster.engine_version
}
