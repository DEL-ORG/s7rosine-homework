variable "aws_region" {
  description = "The AWS region where resources will be created"
  type        = string
}

variable "secret_name" {
  description = "The name of the secret to be created in Secrets Manager"
  type        = string
}

variable "secret_description" {
  description = "A description of the secret"
  type        = string
}

variable "secret_value" {
  description = "The secret value to store in Secrets Manager"
  type        = map(string)
}
variable "common_tags" {
  type = map(string)
}
