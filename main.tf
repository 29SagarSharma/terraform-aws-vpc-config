provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "./vpc"
  cidr_block           = "10.0.0.0/16"
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  environment          = var.environment
}


module "security" {
  source            = "./security"
  vpc_id            = module.vpc.vpc_id
  bastion_ip        = var.my_ip
  bastion_subnet_id = module.vpc.public_subnet_ids[0]
  app_subnet_id     = module.vpc.private_subnet_ids[0]
}

module "ec2" {
  source            = "./ec2"
  bastion_subnet_id = module.vpc.public_subnet_ids[0]
  app_subnet_id     = module.vpc.private_subnet_ids[0]
  bastion_sg_id     = module.security.bastion_sg_id
  app_sg_id         = module.security.app_sg_id
  key_name          = var.key_name
  user_data         = file("install_nginx.sh")
  environment       = var.environment
}


