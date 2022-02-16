resource "aws_instance" "webapp" {
  instance_type          = var.instance_type
  ami                    = "ami-0c19f80dba70861db"
  key_name               = "terraform-key"
  #user_data              = file("apache-install.sh")
  vpc_security_group_ids = [aws_security_group.vpc-rdp.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "webapp"
  }

  # connection block for provisioners to connect to EC2 instance
  connection {
    type        = "winrm"
    host        = self.public_ip
    user        = "Administrator"
    #password    = self.password
    private_key = file("private-key/terraform-key.pem")
  }

  # file provisioner
  # provisioner "file" {
  #   source      = "apps/index.html" #local path on your system from where you are running terraform
  #   destination = "/temp/index.html" #remote path where our infrastructure will be created
  # }
  provisioner "remote-exec" {
    inline = [
      "New-Item -ItemType directory -Path C:\\downloads -Force"
    ]
  }
   provisioner "local-exec" {
   command = "echo ${aws_instance.webapp.private_ip} >>ip.txt"
  #  interpreter = [
  #    "Powershell","-Command"
  #  ]
   working_dir = "output/"
  }
}
