output "vpc_id" {

    value = aws_vpc.custom_vpc.id
  
}

output "ec2_public_ips" {

    value = [for i in aws_instance.ec2 : i.public_ip]
  
}