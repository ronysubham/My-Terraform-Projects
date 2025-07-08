variable "region" {

    default = "ap-south-1"

}

variable "vpc_cidr"{
    default = "10.0.0.0/16"
}

variable "public_subnets" {
    default = ["10.0.1.0/24", "10.0.2.0/24"]

}

variable "instance_type"{
    default = "t2.micro"
}

variable "ami_id"{
    default = "ami-0d03cb826412c6b0f"
}
variable "availability_zones" {
  default = ["ap-south-1a", "ap-south-1b"]
}
