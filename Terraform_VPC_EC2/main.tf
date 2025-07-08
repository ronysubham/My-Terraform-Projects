resource "aws_vpc" "custom_vpc" {
    cidr_block = var.vpc_cidr
    
    tags = {
        Name = "custom-vpc"
    }
}

resource "aws_subnet" "public" {
    count = 2 
    vpc_id = aws_vpc.custom_vpc.id
    cidr_block = var.public_subnet_cidr[count.index]
    availability_zone = var.availability_zones[count.index]
    map_public_ip_on_launch = "true"

    tags = {
        Name = "public-subnet-${count.index + 1}"
    }


}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.custom_vpc.id

    tags = {
        Name = "custom-igw"
    }
  
}

resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.custom_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id    

    }
    tags = {
      name = "public_rt"
    }

}


resource "aws_route_table_association" "public_rt_assoc" {
    count = 2
    subnet_id = aws_subnet.public[count.index].id
    route_table_id = aws_route_table.public_rt.id
}


resource "aws_instance" "ec2" {
    count = 2
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public[count.index].id
    key_name = var.key_name

    tags = {
        Name = "web-${count.index + 1}"
    }
  
}


