# TERRAFORM
# Description: 
# ---


variable "AMI_ID" {
  description = "AMI Ubuntu eu-central-1"
  type        = string
  default     = "ami-065deacbcaac64cf2"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key Name"
  type        = string
  default     = ""
}