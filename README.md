Terraform AWS VPC with Bastion & Private EC2

 Overview

This project provisions a secure, modular AWS infrastructure using Terraform. It sets up:

- A VPC across 2 Availability Zones
- Public & private subnets
- Bastion EC2 (public) for SSH access
- App EC2 (private) with NGINX, accessed via Bastion
- NAT Gateway for outbound traffic from private subnets

  Modules

- **vpc/**: Creates VPC, subnets, route tables, IGW, and NAT Gateway  
- **security/**: Defines Security Groups with least privilege  
- **ec2/**: Launches Bastion and App EC2 instances

1. Prerequisites

- AWS CLI configured  
- Terraform installed  
- SSH key pair uploaded to AWS

2. Configure `terraform.tfvars`
key_name              = "sharda_ssh"
environment           = "dev"
aws_region            = "us-east-1"
vpc_cidr              = "10.0.0.0/16"
availability_zones    = ["us-east-1a", "us-east-1b"]
bastion_instance_type = "t2.micro"
app_instance_type     = "t2.micro" 

3. Using S3 backend with state locking (DynamoDB)
If using S3 remote backend:
terraform {
  backend "s3" {
    bucket         = "your-terraform-bucket"
    key            = "env/dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
  }
}

- Create a S3 bucket manually
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "2905-s3-state" #change this
}

- Create the DynamoDB table manually with:
aws dynamodb create-table \
  --table-name terraform-lock \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --billing-mode PAY_PER_REQUEST \
  --region us-east-1

4. Deploy
terraform init
terraform apply
