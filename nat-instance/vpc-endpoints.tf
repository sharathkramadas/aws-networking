# locals {
#   endpoints = {
#     "endpoint-ssm" = {
#       name = "ssm"
#     },
#     "endpoint-ssmm-essages" = {
#       name = "ssmmessages"
#     },
#     "endpoint-ec2-messages" = {
#       name = "ec2messages"
#     }
#   }
# }

# resource "aws_vpc_endpoint" "endpoints" {
#   vpc_id            = aws_vpc.main.id
#   for_each          = local.endpoints
#   vpc_endpoint_type = "Interface"
#   service_name      = "com.amazonaws.ap-southeast-1.${each.value.name}"
#   # Add a security group to the VPC endpoint
#   security_group_ids = [aws_security_group.allow_tls.id]
# }