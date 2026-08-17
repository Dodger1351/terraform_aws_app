data "aws_iam_role" "my_role" {
  name = "prod-ec2-gft-role"
}

resource "aws_iam_instance_profile" "ec2_role" {
  name = "prod-ec2-gft-role-profile"
  role = data.aws_iam_role.my_role.id
}