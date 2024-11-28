resource "aws_rds_cluster" "main" {
  cluster_identifier = "${local.name}-db"
  engine             = "aurora-mysql"
  engine_version     = "8.0.mysql_aurora.3.05.2"
  availability_zones = [
    "ap-northeast-1a",
    "ap-northeast-1c",
    "ap-northeast-1d",
  ]
  master_username = "admin"
  vpc_security_group_ids = [
    aws_security_group.db_sg.id,
  ]
}
