# resource "aws_network_interface" "test" {
#   subnet_id = aws_subnet.public.id
#   source_dest_check = false

#   attachment {
#     instance     = aws_instance.nat-instance.id
#     device_index = 1
#   }
  
# }