resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.example.id
}


resource "aws_route_table" "nat-instance-route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    network_interface_id = aws_instance.nat-instance.primary_network_interface_id
  }

}

resource "aws_route_table_association" "nat-instance-route-association" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.nat-instance-route.id
}