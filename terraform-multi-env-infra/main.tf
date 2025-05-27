provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "ec2" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  
  tags = {
    Name = "${terraform.workspace}-ec2-instance"
    Environment = terraform.workspace
  }
}



