# #SSH trafic
# resource "aws_security_group" "sg-regular" {
#     name = "demo-regular"
#     description = "demo-regular "
#     ingress {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       description = "allow port 22 "
#       from_port = 22 
#       protocol = "tcp"
#       self = false
#       to_port = 22 
#     }
#      ingress {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       description = "allow port 80 "
#       from_port = 80 
#       protocol = "tcp"
#       self = false
#       to_port = 80 
#     }
#      ingress {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       description = "allow port 443 "
#       from_port = 443 
#       protocol = "tcp"
#       self = false
#       to_port = 443 
#     }
#      ingress {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       description = "allow port 8080 "
#       from_port = 8080 
#       protocol = "tcp"
#       self = false
#       to_port = 8080 
#     }
#      ingress {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       description = "allow port 8081 "
#       from_port = 8081 
#       protocol = "tcp"
#       self = false
#       to_port = 8081 
#     }
# }
