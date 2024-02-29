resource "aws_iam_instance_profile" "ssm-iam-profile" {
  name            = "ec2_profile"
  role            = aws_iam_role.ssm-iam-role.name
}

resource "aws_iam_role" "ssm-iam-role" {
  name            = "ssm-role"
  description     = "The role for EC2 SSM access"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {
      "Service": "ec2.amazonaws.com"
    },
    "Action": "sts:AssumeRole"
  }
}
EOF

}

resource "aws_iam_policy_attachment" "ssm-instance-policy" {
  name          = "ssm-iam-role-attachment"
  policy_arn    = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  roles = [aws_iam_role.ssm-iam-role.name]
}