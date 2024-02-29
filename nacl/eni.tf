# resource "aws_network_interface" "test" {
#   subnet_id       = aws_subnet.main.id
#   # security_groups = [aws_security_group.allow_tls.id]

#   attachment {
#     instance     = aws_instance.foo.id
#     device_index = 1
#   }
# }