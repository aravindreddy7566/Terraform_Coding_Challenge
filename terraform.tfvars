aws_region           = "us-east-1"
vpc_cidr             = "10.0.0.0/16"
vpc_name             = "Ansys_main"
key_name             = "AWSB-65-KEY"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_cidrs = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
azs                  = ["us-east-1a", "us-east-1b", "us-east-1c"]
environment          = "dev"
instance_type = {
  dev = "t2.small"
}
imagename = "ami-005417df848d783b6"
projid    = "PHOENIX-123"
