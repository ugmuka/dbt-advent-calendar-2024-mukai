resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${local.name}-internet-gateway"
  }
}

resource "aws_nat_gateway" "public_a" {
  allocation_id = aws_eip.public_a.id
  subnet_id     = aws_subnet.public_a.id
  tags = {
    Name = "${local.name}-public-nat-gateway-a"
  }
}

resource "aws_nat_gateway" "public_c" {
  allocation_id = aws_eip.public_c.id
  subnet_id     = aws_subnet.public_c.id
  tags = {
    Name = "${local.name}-public-nat-gateway-c"
  }
}
