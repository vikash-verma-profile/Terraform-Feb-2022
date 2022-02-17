variable "aws_region" {
  description = "Region in which aws instance to be created"
  type=string
  default = "us-east-1"
}
variable "instance_type" {
  description = "Ec2 Instance Type-Instance Sizing"
  type=string
  default = "t2.micro"
}