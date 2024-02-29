resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = "ssh-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "ssh_private_key" {
  sensitive_content   = tls_private_key.example.private_key_pem
  filename            = "ssh-key"
  file_permission     = "0644"
}