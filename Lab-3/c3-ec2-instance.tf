resource "aws_instance" "webapp" {
instance_type = "t2.micro"
ami = "ami-033b95fb8079dc481"
 tags = {
   "Name" = "webapp-1"
 }
}