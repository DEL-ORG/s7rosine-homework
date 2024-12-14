variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "List of CIDR blocks for public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "List of CIDR blocks for private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "List of availability zones to use for the subnets"
  type        = list(string)
}

# variable "tags" {
#   description = "Additional tags for resources"
#   type        = map(string)
#   default     = {}
# }

variable "common_tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
}
