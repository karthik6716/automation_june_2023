output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_subnet_ids" {
  value = { for index, each_subnet in aws_subnet.private_subnet : index => each_subnet.id }
}

output "public_subnet_ids" {
  value = { for index, each_subnet in aws_subnet.public_subnet : index => each_subnet.id }
}

