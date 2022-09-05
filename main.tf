resource "aws_ssoadmin_permission_set" "permset" {
  name             = var.name
  description      = var.descrição
  instance_arn     = tolist(data.aws_ssoadmin_instances.datainstance.arns)[0]
  relay_state      = "https://s3.console.aws.amazon.com/s3/home?region=us-east-1#"
  session_duration = "PT2H"
}



resource "aws_ssoadmin_managed_policy_attachment" "managepolicy" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.datainstance.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  permission_set_arn = aws_ssoadmin_permission_set.permset.arn
}

resource "aws_ssoadmin_managed_policy_attachment" "managepolicy1" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.datainstance.arns)[0]
  managed_policy_arn = "arn:aws:iam::aws:policy/AWSDirectConnectReadOnlyAccess"
  permission_set_arn = aws_ssoadmin_permission_set.permset.arn
}

