resource "aws_eip" "public_a" {
  domain = "vpc"
  tags = {
    Name = "${local.name}-public-eip-a"
  }
}

resource "aws_eip" "public_a_bustion" {
  domain = "vpc"
  tags = {
    Name = "${local.name}-public-eip-a-bustion"
  }
}

resource "aws_eip" "public_c" {
  domain = "vpc"
  tags = {
    Name = "${local.name}-public-eip-c"
  }
}

# resource "aws_eip_association" "bastion_eip" {
#   instance_id   = aws_instance.bastion.id
#   allocation_id = aws_eip.public_a_bustion.id
# }
