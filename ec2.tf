resource "aws_instance" "nginx_instance_public" {
  count                       = local.new_environment == "dev" ? 3 : 1
  
  ami                         = var.imagename
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public-subnets.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.sg_public.id]
  associate_public_ip_address = true
  user_data                   = <<-EOF
              sudo yum update -y
              sudo amazon-linux-extras install nginx1.12 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              sudo useradd nginx
              sudo mkdir /home/nginx
              sudo chown nginx:nginx /home/nginx
              EOF

  tags = {
    Name              = "${var.vpc_name}-PublicServer-${count.index + 1}"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
    ManagedBy         = "Terraform"
    Inventory         = "Dynamic"
  }
}

resource "aws_instance" "nginx_instance_private" {
  count                       = local.new_environment == "dev" ? 3 : 1
  
  ami                         = var.imagename
  instance_type               = lookup(var.instance_type, local.new_environment)
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.private-subnets.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.sg_public.id]
  associate_public_ip_address = false
  user_data                   = <<-EOF
              sudo yum update -y
              sudo amazon-linux-extras install nginx1.12 -y
              sudo systemctl start nginx
              sudo systemctl enable nginx
              sudo useradd nginx
              sudo mkdir /home/nginx
              sudo chown nginx:nginx /home/nginx
              EOF

  tags = {
    Name              = "${var.vpc_name}-PrivateServer-${count.index + 1}"
    Terraform-Managed = "Yes"
    Env               = local.new_environment
    ProjectID         = local.projid
    ManagedBy         = "Terraform"
    Inventory         = "Dynamic"
  }
}
