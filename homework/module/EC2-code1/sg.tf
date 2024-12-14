resource "aws_security_group" "terra_sg" {
  name        = "terra-sg3"  # Set the name of the security group to terra-sg
  description = "Security group for EC2 instance allowing SSH access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Adjust to restrict SSH access to specific IPs if needed
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}