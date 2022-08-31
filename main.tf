# TERRAFORM
# Description: 
# ---

provider "aws" {}



#   AWS EC2
resource "aws_instance" "UbuntuEC2" {
  count         = 3
  ami           = var.AMI_ID
  instance_type = var.instance_type
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.EC2_SG.id]
  user_data     = "${file("UserData/init_vpn.sh")}"

  tags = {
    Name = "test"
  }
}



resource "aws_security_group" "EC2_SG" {
  name        = "Security Group in default VPC"
  description = "Simple SG with SSH connection for EC2 in default VPC"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}