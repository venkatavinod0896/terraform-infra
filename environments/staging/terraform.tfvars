region               = "us-east-1"
env_name             = "staging"
vpc_cidr             = "10.0.0.0/16"
public_subnet_cidrs  = ["10.0.1.0/24","10.0.2.0/24"]
private_subnet_cidrs = ["10.0.101.0/24","10.0.102.0/24"]
instance_type        = "t3.micro"
key_pair             = "staging-key"
ssh_allowed_cidrs    = ["106.222.229.120/32"]
