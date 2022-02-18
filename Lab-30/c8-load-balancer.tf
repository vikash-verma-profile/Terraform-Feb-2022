resource "aws_elb" "bar" {
  name               = "sample"
  subnets            = [aws_subnet.vpc-dev-public-subnet-1.id]
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }
  #   listener {
  #     instance_port     = 8000
  #     instance_protocol = "http"
  #     lb_port           = 443
  #     lb_protocol       = "https"
  #     ssl_certificate_id = "arn:aws:iam::123456789012:server-certificate/certName"
  #   }
  health_check {
    interval            = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 6
    target              = "HTTP:8000/"
  }
  instances                   = [aws_instance.webapp.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

}

