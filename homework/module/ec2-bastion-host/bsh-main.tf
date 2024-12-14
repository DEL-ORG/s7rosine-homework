resource "aws_instance" "ec2" {
  count = 2
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = var.instance_type
  subnet_id     = count.index == 0 ? data.aws_subnet.public_subnet.id : data.aws_subnet.private_subnet.id
  key_name      = data.aws_key_pair.jenkins_key.key_name
  vpc_security_group_ids = [
    data.aws_security_group.public-ec2-sg.id
  ]

  #   provisioner "remote-exec" {
  #   inline = [
  #     "yum update -y",
  #     "yum install httpd -y",
  #     "systemctl start httpd",
  #     "systemctl enable httpd",
  #     "mkdir -p /var/www/html/yellow",
  #     "echo \"<html><body style='background-color:yellow;'><h1>Yellow Webserver</h1><p>Hostname: $(hostname)</p><p>IP Address: $(hostname -I | awk '{print $1}')</p></body></html>\" > /var/www/html/yellow/index.html",
  #     "chown -R apache:apache /var/www/html/yellow",
  #     "chmod -R 755 /var/www/html/yellow"
  #   ]
  #   connection {
  #   type        = "ssh"
  #   user        = "ubuntu"                     # Default Ubuntu user
  #   private_key = file("C:/Users/User/Downloads/jenkins.pem") # Path to the private key on the public EC2 instance
  #   bastion_host = aws_instance.ec2[0].public_ip  # Public IP of the public EC2 (bastion)
  #   bastion_user = "ubuntu"                        # User for the bastion
  #   host        = self.private_ip                  # Private IP of the private EC2

    
  # }

  #   }

  
  tags = merge(var.common_tags, {
    Name = format("%s-%s-%s-%s", var.common_tags["environment"], var.common_tags["owner"], var.common_tags["project"], count.index == 0 ? "public_subnet" : "private_subnet")
  })
}

