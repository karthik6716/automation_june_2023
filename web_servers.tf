resource "aws_instance" "this" {
  ami           = data.aws_ami.this.id
  instance_type = "t2.micro"
  key_name      = var.key_name
  subnet_id     = element([for each_subnet in aws_subnet.private_subnet : each_subnet.id], 0)
  tags = {
    Name = local.web_server_name
  }
  vpc_security_group_ids = [aws_security_group.this.id]
  # user_data              = file("${path.module}/user_data.sh")
}

resource "aws_security_group" "this" {
  name        = "allow_web_server"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.this.id

  dynamic "ingress" {
    for_each = [22, 80]
    iterator = each
    content {
      description = "allow tls for webserver"
      from_port   = each.value
      to_port     = each.value
      protocol    = "tcp"
      cidr_blocks = [aws_vpc.this.cidr_block]
    }
  }

  # dynamic "ingress" {
  #   for_each = var.inbound_rules_web
  #   content {
  #     description = ingress.value.description
  #     from_port   = ingress.value.port
  #     to_port     = ingress.value.port
  #     protocol    = ingress.value.protocol
  #     cidr_blocks = [aws_vpc.this.cidr_block]
  #   }
  # }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_server"
  }
}




# for ingress we have to define each child block in security group to open multiple ports

# ingress {
#   description      = "TLS from VPC"
#   from_port        = 80
#   to_port          = 80
#   protocol         = "tcp"
#   cidr_blocks      = [aws_vpc.this.cidr_block]
# }

# ingress {
#   description      = "TLS from VPC"
#   from_port        = 22
#   to_port          = 22
#   protocol         = "tcp"
#   cidr_blocks      = [aws_vpc.this.cidr_block]
# }

# or use itirator in dynamic resource block

# dynamic "ingress" {
#   # for_each = [22 , 80] here we can pass list, map or set and work differently in dynamic block than for loop in subnet in the network.tf
#   iterator = each
#   content {
#     description = "allow tls for webserver"
#     from_port = each.value
#     to_port = each.value  
#     protocol = "tcp"
#     cidr_blocks = [aws_vpc.this.cidr_block]
#   }
# }