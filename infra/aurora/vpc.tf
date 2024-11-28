resource "aws_vpc" "main" {
  cidr_block = local.vpc_cidr_block
  tags = {
    Name = "${local.name}-vpc"
  }
}

resource "aws_subnet" "public_a" {
  cidr_block              = local.public_subnet_cidrs[0]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1a"
  tags = {
    Name = "${local.name}-public-subnet-a"
  }
}

resource "aws_subnet" "public_c" {
  cidr_block              = local.public_subnet_cidrs[1]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = true
  availability_zone       = "ap-northeast-1c"
  tags = {
    Name = "${local.name}-public-subnet-c"
  }
}

resource "aws_subnet" "private_a" {
  cidr_block              = local.private_subnet_cidrs[0]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1a"
  tags = {
    Name = "${local.name}-private-subnet-a"
  }
}

resource "aws_subnet" "private_c" {
  cidr_block              = local.private_subnet_cidrs[1]
  vpc_id                  = aws_vpc.main.id
  map_public_ip_on_launch = false
  availability_zone       = "ap-northeast-1c"
  tags = {
    Name = "${local.name}-private-subnet-c"
  }
}

resource "aws_db_subnet_group" "main" {
  name = "${local.name}-subnet-group"
  subnet_ids = [
    aws_subnet.public_a.id,
    aws_subnet.public_c.id,
    aws_subnet.private_a.id,
    aws_subnet.private_c.id,
  ]

  tags = {
    Name = "${local.name}-subnet-group"
  }
}
