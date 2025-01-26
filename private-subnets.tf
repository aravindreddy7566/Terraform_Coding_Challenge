resource "aws_subnet" "private-subnets" {

  count             = length(local.new_private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(local.new_private_subnet_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  tags = {
    Name              = "${var.vpc_name}-PrivateSubnet-${count.index + 1}"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
  }
}