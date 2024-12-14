
variable "aws_region" {
  type = string
}

variable "instance_type" {
  type        = string

}

variable "key_name" {
  type        = string
}

variable "resource_type" {
  type = string
}

variable "common_tags" {
  type        = map(string)
}

