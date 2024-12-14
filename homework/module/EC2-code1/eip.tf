# Create an Elastic IP
resource "aws_eip" "eip" {

  instance = aws_instance.s7rosine_ec2_instance.id

 
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-eip", var.common_tags["environment"], var.common_tags["owner"], var.common_tags["project"])
    },
  )
}

# Associate the Elastic IP with the instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.s7rosine_ec2_instance.id
  allocation_id = aws_eip.eip.id
}