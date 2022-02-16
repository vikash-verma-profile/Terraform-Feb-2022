#SSH trafic
resource "aws_security_group" "vpc-rdp" {
    name = "vpc-rdp"
    description = "vpc-rdp "
    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 3389 "
      from_port = 3389 
      protocol = "tcp"
      self = false
      to_port = 3389 
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

resource "aws_security_group" "vpc-web" {
    name = "vpc-web"
    description = "vpc-web "
    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 80"
      from_port = 80
      protocol = "tcp"
      self = false
      to_port = 80
    }
    ingress {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "allow port 443"
      from_port = 443
      protocol = "tcp"
      self = false
      to_port = 443
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