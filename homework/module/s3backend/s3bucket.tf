resource "aws_s3_bucket" "tf-state" {
  provider       = aws.source-region
  force_destroy  = var.force_destroy
  bucket         = format("%s-%s-%s-tf-state", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])
  tags = merge(
    var.common_tags,
    {Name = format("%s-%s-%s-tf-state", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )          
}
resource "aws_s3_bucket_versioning" "state_versioning" {
  provider = aws.source-region
  depends_on = [aws_s3_bucket.tf-state]
  bucket     = aws_s3_bucket.tf-state.id
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket" "tf-backup" {
  provider       = aws.destination-region
  force_destroy  = var.force_destroy
  bucket         = format("%s-%s-%s-tf-backup", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])
  tags = merge(
    var.common_tags,
    {Name = format("%s-%s-%s-tf-backup", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"]) }
  )          
}
resource "aws_s3_bucket_versioning" "backup_versioning" {
  provider = aws.destination-region
  depends_on = [aws_s3_bucket.tf-backup]
  bucket     = aws_s3_bucket.tf-backup.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_replication_configuration" "replication" {
  depends_on = [
    aws_s3_bucket_versioning.state_versioning,
    aws_s3_bucket_versioning.backup_versioning
  ]
  bucket = aws_s3_bucket.tf-state.id
  role   = aws_iam_role.replication.arn

  rule {
    id     = "StateReplicationRule"
    status = "Enabled"

    destination {
      bucket        = aws_s3_bucket.tf-backup.arn
      storage_class = "STANDARD"
    }
  }
}
