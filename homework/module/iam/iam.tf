# Create the IAM Group
resource "aws_iam_group" "student_group" {
  name = var.group_name
}

# Create IAM Users
resource "aws_iam_user" "users" {
  for_each = toset(var.user_list)

  name = each.key

  tags = merge(var.common_tags, {
    Name = each.key
  })
}

# Add each user to the IAM Group
resource "aws_iam_group_membership" "group_membership" {
  name  = "${var.group_name}-membership"
  group = aws_iam_group.student_group.name

  users = [for user in aws_iam_user.users : user.name]
}

# Attach Policies to the Group
resource "aws_iam_group_policy_attachment" "group_policy_attachment" {
  group      = aws_iam_group.student_group.name
  policy_arn = var.policy_arn
}
