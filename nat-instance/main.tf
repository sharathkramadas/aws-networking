resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

data "aws_ami" "amazon_linux_2_ssm" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

data "aws_ami" "nat" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn-ami-vpc-nat-2018.03.0.20230821.0-x86_64-ebs"]
  }

  owners = ["137112412989"] # Canonical
}

resource "aws_instance" "ssm" {
  ami           = data.aws_ami.amazon_linux_2_ssm.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private.id
  iam_instance_profile = aws_iam_instance_profile.ssm-iam-profile.name
  vpc_security_group_ids = [
    aws_security_group.ssm-security-group.id,
  ]
  # key_name      = aws_key_pair.generated_key.key_name

  tags = {
    Name = "ssm-instance"
  }

}

resource "aws_instance" "nat-instance" {
  ami           = data.aws_ami.nat.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public.id
  vpc_security_group_ids = [
    aws_security_group.nat-security-group.id,
  ]
  # key_name      = aws_key_pair.generated_key.key_name
  source_dest_check = false

  tags = {
    Name = "nat-instance"
  }

}
