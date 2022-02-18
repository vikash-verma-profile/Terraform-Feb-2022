
locals {
  ports = {
    dev     = "80"
    stage   = "443"
    qa      = "22"
    prod    = "8080"
    preprod = "8081"
  }
}

resource "aws_security_group" "sg-dynamic" {
  name        = "demo-dynamic"
  description = "demo-dynamic "

  #dynamic block
  dynamic "ingress" {
    for_each = local.ports
    content {
      description = "description ${ingress.key}"
      cidr_blocks = ["0.0.0.0/0"]
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
    }

  }
}
