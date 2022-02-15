variable "aws_region" {
  description = "Region in which aws resources to be created"
  type=string
  default = "us-east-1"
}

variable "ec2_ami_id" {
  description="AMI ID"
  type = string
  default = "ami-033b95fb8079dc481"
}
variable "ec2_instance_count" {
  description="Ec2 instance count"
  type = number
}