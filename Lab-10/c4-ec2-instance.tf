resource "aws_instance" "webapp" {
instance_type = var.instance_type
ami = "ami-033b95fb8079dc481"
key_name = "terraform-key"
vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
 tags = {
   "Name" = "webapp"
 }

# connection block for provisioners to connect to EC2 instance
 connection {
   type="ssh"
   host=self.public_ip
   user="ec2-user"
   password=""
   private_key = file("private-key/terraform-key.pem")
 }

# file provisioner
 provisioner "file" {
   source="apps/index.html"  #local path on your system from where you are running terraform
   destination = "/tmp/index.html"#remote path where our infrastructure will be created
 }
}