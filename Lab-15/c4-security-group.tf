
#Create Security Groups
resource "aws_security_group" "dev-vpc-sg" {
  name        = "dev-vpc-default-sg"
  description = "dev default security group"
  vpc_id      = aws_vpc.vpc-dev.id
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow port 22"
    from_port   = 22
    protocol    = "tcp"
    self        = false
    to_port     = 22
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow port 80"
    from_port   = 80
    protocol    = "tcp"
    self        = false
    to_port     = 80
  }
  egress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "allow all ip and ports"
    from_port   = 0
    protocol    = "-1"
    self        = false
    to_port     = 0
  }

}