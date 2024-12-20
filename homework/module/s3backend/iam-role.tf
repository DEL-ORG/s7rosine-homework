resource "aws_iam_role" "replication" {
  provider = aws.source-region
  name     = format("%s-%s-%s-s3-replication-role", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])

  assume_role_policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
POLICY
  tags               = var.common_tags
}

resource "aws_iam_policy" "replication" {
  provider = aws.destination-region
  name     = format("%s-%s-%s-s3-replication-policy", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:GetReplicationConfiguration",
        "s3:ListBucket"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.tf-state.arn}"
      ]
    },
    {
      "Action": [
        "s3:GetObjectVersion",
        "s3:GetObjectVersionAcl"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.tf-state.arn}/*"
      ]
    },
    {
      "Action": [
        "s3:ReplicateObject"
      ],
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.tf-backup.arn}/*"
    }
  ]
}
POLICY
}

resource "aws_iam_policy_attachment" "replication" {
  provider   = aws.destination-region
  name       = format("%s-%s-%s-s3-replication-policy-attachment", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])
  roles      = ["${aws_iam_role.replication.name}"]
  policy_arn = aws_iam_policy.replication.arn
}