output "instance_id" {
  description = "ID of the EC2 instance"
  value = aws_instance.app_server.id
}

output "instance_public_id" {
  description = "IP address of the EC2 instance"
  value = aws_instance.app_server.public_ip
}