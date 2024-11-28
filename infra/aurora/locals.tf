locals {
  vpc_cidr_block = "10.0.0.0/16"
  private_subnet_cidrs = [
    "10.0.0.0/20",
    "10.0.16.0/20"
  ]
  public_subnet_cidrs = [
    "10.0.32.0/20",
    "10.0.48.0/20"
  ]
}
