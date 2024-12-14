output "vpc_id" {
  value = data.aws_vpc.vpc.id
}

output "subnet1" {
  value = data.aws_subnet.subnet.id
}

output "instance_public_ip" {
  value       = aws_instance.s7rosine_ec2_instance.public_ip
}

output "jenkins_master_ami" {
  value = data.aws_ami.ubuntu.id
}