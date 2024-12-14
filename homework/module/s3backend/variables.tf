variable "aws_source_region" {
  type        = string
}

variable "aws_destination_region" {
  type        = string
}

variable "force_destroy" {
  type    = bool
}

variable "common_tags" {
  type = map(string)
}
  

