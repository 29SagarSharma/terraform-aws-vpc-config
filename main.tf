provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./vpc"
  cidr_block        = "10.0.0.0/16"
  availability_zones = var.availability_zones
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
  environment = var.environment
}


}
