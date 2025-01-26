resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name              = var.vpc_name
    Owner             = "Aravind K"
    environment       = local.new_environment
    Terraform-Managed = "Yes"
    ProjectID         = local.projid
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name              = "${var.vpc_name}-IGW"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}

resource "aws_eip" "nat" {
  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "main" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-subnets[0].id
  depends_on    = [aws_subnet.public-subnets]

  tags = {
    Name = "${var.vpc_name}-NATGW"
  }
}
