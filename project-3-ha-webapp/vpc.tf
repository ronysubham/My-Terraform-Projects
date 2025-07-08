resource "aws_vpc" "main"{
     cidr_block = var.vpc_cidr
     enable_dns_support = true
     enable_dns_hostnames = true

}

resource "aws_internet_gateway" "igw"{

    vpc_id = aws_vpc.main.id


}


resource "aws_subnet" "public"{
    count                   = length(var.public_subnets)
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = element(var.availability_zones, count.index)
  map_public_ip_on_launch = true


    tags ={
        Name = "publicsubnet-${count.index + 1}"
    }
}


resource "aws_route_table" "public" {

    vpc_id = aws_vpc.main.id
}

resource "aws_route" "internte_access"{
    route_table_id = aws_route_table.public.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "public_assoc" {

    count = length(var.public_subnets)
    route_table_id = aws_route_table.public.id
    subnet_id = aws_subnet.public[count.index].id

  
}