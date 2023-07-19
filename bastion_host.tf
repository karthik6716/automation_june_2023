resource "aws_instance" "bastion" {
  ami           = "ami-026ebd4cfe2c043b2"
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = element([for each_subnet in aws_subnet.public_subnet : each_subnet.id], 0)
  tags = {
    Name = local.bastion_host
  }
  # provisioner "local-exec" {
  #   command = "scp -i ~/Downloads/terraform-key.pem ~/Downloads/terraform-key.pem ec2-user@${self.public_ip}:~"
  #   # provisionner is use as last resort --- privilege manual ssh procedure
  # }
  vpc_security_group_ids = [aws_security_group.bastion.id]
  #   user_data              = file("${path.module}/user_data.sh")
}

