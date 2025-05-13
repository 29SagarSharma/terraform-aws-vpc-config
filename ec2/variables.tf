variable "bastion_subnet_id" {}
variable "app_subnet_id" {}
variable "bastion_sg_id" {}
variable "app_sg_id" {}
variable "key_name" {}
variable "user_data" {}
variable "environment" {}
variable "bastion_ami" {
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2
}
variable "app_ami" {
  default = "ami-0c02fb55956c7d316"
}
