resource "aws_ssoadmin_managed_policy_attachment" "managepolicy" {
  instance_arn       = tolist(data.aws_ssoadmin_instances.datainstance.arns)[0]
  managed_policy_arn = var.manage
  permission_set_arn = aws_ssoadmin_permission_set.permset.arn
}
