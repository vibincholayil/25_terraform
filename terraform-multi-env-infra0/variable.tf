variable "aws_region" {
  description = "The AWS region to deploy the infrastructure"
  type        = string 
}

variable "ami" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
}
variable "instance_type" {
  description = "The type of EC2 instance to create"
  type        = string
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access"
  type        = string
}
variable "subnet_id" {
  description = "The ID of the subnet to launch the EC2 instance in"
  type        = string
}
variable "vpc_security_group_ids" {
  description = "The security group IDs to associate with the EC2 instance"
  type        = list(string)
}