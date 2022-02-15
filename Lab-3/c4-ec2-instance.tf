resource "aws_instance" "webapp" {
instance_type = "t2.nano"
ami = var.ec2_ami_id
count = var.ec2_instance_count
vpc_security_group_ids = [ aws_security_group.dev-ssh.id ]
 tags = {
   "Name" = "${random_string.myrandom.id}"
 }
}