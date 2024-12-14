resource "aws_instance" "s7rosine_ec2_instance" {
  ami                    = data.aws_ami.ubuntu.id  # Replace with your specific AMI ID
  instance_type         = var.instance_type
  subnet_id             = data.aws_subnet.subnet.id   # Replace with your specific subnet ID that belongs to a VPC
  key_name              = var.key_name  # Replace with your key pair name
  depends_on = [ aws_security_group.terra_sg ]
  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]  # Reference the security group by its ID
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-%s", var.common_tags["resource_type"], var.common_tags["environment"], var.common_tags["owner"], var.common_tags["project"])
})

    }

  
  
