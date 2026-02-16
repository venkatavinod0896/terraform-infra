data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

module "vpc" {
  source               = "../../modules/vpc"
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  env_name             = var.env_name
}

module "web_sg" {
  source            = "../../modules/security-group"
  vpc_id            = module.vpc.vpc_id
  env_name          = var.env_name
  ssh_allowed_cidrs = var.ssh_allowed_cidrs
}

module "webserver" {
  source             = "../../modules/ec2"
  ami_id             = data.aws_ami.latest_amazon_linux.id
  instance_type      = var.instance_type
  key_pair           = var.key_pair
  subnet_id          = module.vpc.public_subnets[0]
  security_group_ids = [module.web_sg.security_group_id]
  env_name           = var.env_name
}

module "storage" {
  source   = "../../modules/s3"
  env_name = var.env_name
}
