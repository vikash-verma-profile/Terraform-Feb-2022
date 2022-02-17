resource "aws_instance" "webapp" {
  instance_type          = var.instance_type
  ami                    = data.aws_ami.amzlinux.id
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "webapp"
  }
}
