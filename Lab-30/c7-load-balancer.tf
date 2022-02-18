# # module "alb" {
# #   source             = "terraform-aws-modules/alb/aws"
# #   version            = "~> 6.0"
# #   name_prefix        = "mynnlb"
# #   load_balancer_type = "application"
# #   vpc_id             = aws_vpc.vpc-dev.id
# #   subnets            = [aws_subnet.vpc-dev-public-subnet-1]

# #   #tcp Listner
# #   http_tcp_listeners = [
# #     {
# #       port               = 80
# #       protocol           = "TCP"
# #       target_group_index = 0
# #     }
# #   ]

# #   #tls Listner
# #   https_listeners = [
# #     {
# #       port               = 80
# #       protocol           = "TLS"
# #       target_group_index = 0
# #     },
# #   ]

# #   #target Groups

# #   target_groups = [
# #     {
# #       name_prefix          = "app1",
# #       backend_protocol     = "TCP"
# #       backend_port         = 80
# #       target_type          = "instance"
# #       deregistration_delay = 10
# #       health_check = {
# #         enabled             = true
# #         interval            = 30
# #         path                = "/app1/index.html"
# #         port                = "traffic-port"
# #         healthy_threshold   = 3
# #         unhealthy_threshold = 3
# #         timeout             = 6
# #       }
# #     },
# #   ]
# # }
# module "alb" {
#   source  = "terraform-aws-modules/alb/aws"
#   version = "~> 6.0"

#   name = "my-alb"

#   load_balancer_type = "application"

#   vpc_id             = "vpc-abcde012"
#   subnets            = ["subnet-abcde012", "subnet-bcde012a"]
#   security_groups    = ["sg-edcd9784", "sg-edcd9785"]

#   access_logs = {
#     bucket = "my-alb-logs"
#   }

#   target_groups = [
#     {
#       name_prefix      = "pref-"
#       backend_protocol = "HTTP"
#       backend_port     = 80
#       target_type      = "instance"
#       targets = [
#         {
#           target_id = "i-0123456789abcdefg"
#           port = 80
#         },
#         {
#           target_id = "i-a1b2c3d4e5f6g7h8i"
#           port = 8080
#         }
#       ]
#     }
#   ]

#   https_listeners = [
#     {
#       port               = 443
#       protocol           = "HTTPS"
#       certificate_arn    = "arn:aws:iam::123456789012:server-certificate/test_cert-123456789012"
#       target_group_index = 0
#     }
#   ]

#   http_tcp_listeners = [
#     {
#       port               = 80
#       protocol           = "HTTP"
#       target_group_index = 0
#     }
#   ]

#   tags = {
#     Environment = "Test"
#   }
# }