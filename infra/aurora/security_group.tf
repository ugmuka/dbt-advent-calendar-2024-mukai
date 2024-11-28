resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.main.id
  name   = "${local.name}-db-security-group"
  tags = {
    Name = "${local.name}-db-security-group"
  }

  ingress {
    from_port = 3306
    to_port   = 3306
    protocol  = "TCP"
    security_groups = [
      aws_security_group.bastion_sg.id
    ]
  }
}

resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.main.id
  name   = "${local.name}-bastion-security-group"
  tags = {
    Name = "${local.name}-bastion-security-group"
  }

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "TCP"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}
