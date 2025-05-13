resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami
  instance_type               = "t2.micro"
  subnet_id                   = var.bastion_subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.bastion_sg_id]
  associate_public_ip_address = true
  tags = {
    Name = "bastion-${var.environment}"
  }
}

resource "aws_instance" "app" {
  ami                         = var.app_ami
  instance_type               = "t2.micro"
  subnet_id                   = var.app_subnet_id
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.app_sg_id]
  user_data                   = var.user_data
  associate_public_ip_address = false
  tags = {
    Name = "app-${var.environment}"
  }
}
