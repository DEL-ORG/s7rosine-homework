resource "aws_secretsmanager_secret" "secret" {
  name        = var.secret_name

  tags = merge(
    var.common_tags,
    {
      Name = format("%s-%s-%s-tf-secret", var.common_tags["environment"], var.common_tags["project"], var.common_tags["owner"])
    }
  )
}
variable "db_credentials" {
  description = "Database credentials"
  type = map(string)
  default = {
    DB_USERNAME = "admin"
    DB_PASSWORD = "securePassword123"
  }
}


resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = jsonencode(var.secret_value)
}
