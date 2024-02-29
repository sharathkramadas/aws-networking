resource "aws_network_acl" "main" {
  vpc_id = aws_vpc.main.id

  egress {
    protocol   = -1
    rule_no    = 98
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  # For the updates to work
  ingress {
    protocol   = "tcp"
    rule_no    = 97
    action     = "allow"
    # cidr_block = "${chomp(data.http.myip.body)}/32"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # For the ICMP to work with SSH
  ingress {
    protocol   = "icmp"
    rule_no    = 98
    action     = "allow"
    cidr_block = "${chomp(data.http.myip.body)}/32"
    # cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  # For the SSH to work with a specific IP
  ingress {
    protocol   = "tcp"
    rule_no    = 99
    action     = "allow"
    cidr_block = "${chomp(data.http.myip.body)}/32"
    # cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
}

resource "aws_network_acl_association" "main" {
  network_acl_id = aws_network_acl.main.id
  subnet_id      = aws_subnet.main.id
}