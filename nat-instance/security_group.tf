data "http" "myip" {
  url = "http://checkip.amazonaws.com"
}

resource "aws_security_group" "nat-security-group" {
  name_prefix = "nat-security-group"
  vpc_id      = aws_vpc.main.id
  description = "security group for the EC2 instance"

  # ingress {
  #   description      = "ssh"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"    
  #   cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
  # }

  ingress {
    description      = "http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"    
    cidr_blocks      = ["0.0.0.0/0"]    
  }

  ingress {
    description      = "https"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"    
    cidr_blocks      = ["0.0.0.0/0"]    
  }

  egress {
    description      = "all-egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"    
    cidr_blocks      = ["0.0.0.0/0"]    
  }

  tags = {
    Name = "nat-security-group"
  }
}

resource "aws_security_group" "ssm-security-group" {
  name        = "ssm-security-group"
  description = "Allow TLS outbound traffic"
  vpc_id      = aws_vpc.main.id

  # ingress {
  #   description      = "all-ssh"
  #   from_port        = 22
  #   to_port          = 22
  #   protocol         = "tcp"    
  #   cidr_blocks      = [aws_subnet.public.cidr_block]    
  # }

  # ingress {
  #   description      = "all-icmp"
  #   from_port        = 0
  #   to_port          = 0
  #   protocol         = "icmp"    
  #   cidr_blocks      = [aws_subnet.public.cidr_block]    
  # }

  egress {
    description      = "all-egress"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"    
    cidr_blocks      = ["0.0.0.0/0"]    
  }

  tags = {
    Name = "ssm-security-group"
  }
}

