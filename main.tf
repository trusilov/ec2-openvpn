# TERRAFORM
# Description: 
# ---

provider "aws" {}



#   AWS EC2
resource "aws_instance" "UbuntuEC2" {
  count         = 3
  ami           = 
  instance_type = 
  key_name      = 
  vpc_security_group_ids = #[aws_security_group.EC2_SG.id]
  user_data     = "${file("UserData/___")}"

  tags = {
    Name = "test"
  }
}