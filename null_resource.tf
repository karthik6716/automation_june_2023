# resource "null_resource" "provisioner" {
#   # Changes to any instance of the cluster requires re-provisioning
#   triggers = {
#     always_run = timestamp()
#   }
#   depends_on = [aws_instance.bastion]

#   connection {
#     host        = aws_instance.bastion.public_ip
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = "~/automation_june_2023/key-pair"
#   }

#   provisioner "file" {
#     source = "~/automation_june_2023/key-pair"
#     # content     = "~/automation_june_2023/key-pair"
#     destination = "/home/ec2-user/key-pair"
#   }

#   # provisioner "local-exec" {
#   #   command = "scp -o StrictHostKeyChecking=no -i ~/automation_june_2023/key-pair ~/automation_june_2023/key-pair ec2-user@${aws_instance.bastion.public_ip}:~"
#   #   # provisionner is use as last resort --- privilege manual ssh procedure
#   # }

#   provisioner "remote-exec" {
#     inline = [
#       "chmod 400 key-pair"
#     ]
#   }

# }