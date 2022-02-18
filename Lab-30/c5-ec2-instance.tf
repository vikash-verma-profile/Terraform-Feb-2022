resource "aws_instance" "webapp" {
  instance_type          = var.instance_type
  ami                    = "ami-0c19f80dba70861db"
  key_name               = "terraform-key"
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
  tags = {
    "Name" = "webapp"
  }
}
