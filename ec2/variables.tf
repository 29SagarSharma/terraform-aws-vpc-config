variable "bastion_subnet_id" {}
variable "app_subnet_id" {}
variable "bastion_sg_id" {}
variable "app_sg_id" {}
variable "key_name" {}
variable "user_data" {}
variable "environment" {}
variable "bastion_ami" {
  default = "ami-0261755bbcb8c4a84" # Amazon Linux 2
}
variable "app_ami" {
  default = "ami-0261755bbcb8c4a84"
}
