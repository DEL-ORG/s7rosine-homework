variable "aws_region" {
  description = "AWS region for the resources"
  type        = string
}

variable "group_name" {
  description = "Name of the IAM group"
  type        = string
}

variable "user_list" {
  description = "List of usernames to create"
  type        = list(string)
}

variable "policy_arn" {
  description = "IAM policy ARN to attach to the group"
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
}
