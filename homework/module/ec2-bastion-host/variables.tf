# Define the instance type for both EC2 instances
variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
  default     = "t2.micro" # You can adjust this to your preferred instance type
}

# Define the SSH key pair name to access the EC2 instances
variable "key_name" {
  description = "The name of the SSH key pair to use for EC2 access"
  type        = string
  default     = "jenkins" # The existing key pair name
}
variable "common_tags" {
  type = map(any)
  default = {
    resource_type    = "ec2"
    "id"             = "2008"
    "owner"          = "katya"
    "environment"    = "dev"
    "project"        = "healthcare"
    "create_by"      = "Terraform"
    "cloud_provider" = "aws"
    "company"        = "EKS"
  }
}
variable "aws_region" {
  default     = "us-east-1"
}