resource "aws_instance" "web" {
instance_type = "t2.micro"
ami = "ami-038b3df3312ddf25d"
availability_zone = "us-east-1a"
#availability_zone = "us-east-1b"
 tags = {
   "Name" = "web-3"
 }
 lifecycle {
  # create_before_destroy=true
  #prevent_destroy = true
  ignore_changes = [
    tags
  ]
 }
}
