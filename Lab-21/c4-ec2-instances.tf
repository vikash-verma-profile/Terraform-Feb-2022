resource "aws_instance" "webapp" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.amzlinux.id
  key_name               = "terraform-key"
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "webapp"
  }
}

#wait for 90 second 
resource "time_sleep" "wait_90_seconds" {
  depends_on = [
    aws_instance.webapp
  ]
  create_duration = "90s"
}

#sync app static content to webserver using provisioner
resource "null_resource" "sync_app1_static" {
  depends_on = [
    time_sleep.wait_90_seconds
  ]
  triggers = {
    always-update = timestamp()
  }

  connection {
    type        = "ssh"
    host        = aws_instance.webapp.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/terraform-key.pem")
  }
  #copis the file

  provisioner "file" {
    source      = "apps" #local path on your system from where you are running terraform
    destination = "/tmp" #remote path where our infrastructure will be created
  }
}
