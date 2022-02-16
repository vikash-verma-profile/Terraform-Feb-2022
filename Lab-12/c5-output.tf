#define output variable

output "ec2_instance_public_ip" {
  description = "Ec2 Instance Public IP"
  value       = aws_instance.webapp.*.public_ip
}
output "ec2_publicdns" {
  description = "Public DNS url of a EC2 Instances"
  value       = aws_instance.webapp.*.public_dns
}
