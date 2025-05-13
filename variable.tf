variable "aws_region" {
  default = "us-east-1"
}

variable "availability_zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "environment" {
  default = "dev"
}

variable "key_name" {}

variable "my_ip" {
  description = "Your IP for SSH access to bastion"
}
