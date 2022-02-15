resource "aws_security_group" "dev-ssh" {
    name = "dev-ssh"
    description = "dev ssh "
    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 22"
      from_port = 22
      protocol = "tcp"
      self = false
      to_port = 22
    }
    egress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow all ip and ports"
      from_port = 0
      protocol = "-1"
      self = false
      to_port = 0
    }
  
}