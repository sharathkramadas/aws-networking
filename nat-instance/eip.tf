resource "aws_eip" "eip" {
  domain = "vpc"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.nat-instance.id
  allocation_id = aws_eip.eip.id
}

output "eip" {
  value = aws_eip.eip.public_ip
}