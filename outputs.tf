output "instance_ip" {
  description = "ID de instancia EC2"
  value = aws_instance.blockstellart.id
}
output "instance_public_ip" {
  description = "ID de instancia EC2"
  value = aws_instance.blockstellart.public_ip
}