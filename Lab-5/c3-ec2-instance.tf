resource "aws_instance" "my-ec2-vm" {
instance_type = "t2.nano"
ami = "ami-033b95fb8079dc481"
subnet_id = aws_subnet.vpc-dev-public-subnet-1.id
vpc_security_group_ids = [ aws_security_group.dev-vpc-sg.id ]
 tags = {
   "Name" = "myec2vm"
 }
}