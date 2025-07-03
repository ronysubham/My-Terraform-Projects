variable "region" {
    description = "this is the region where the resources will be created"
    type =string
}

variable "instance_type" {
    description = "this is the type of the instance"
    type = string
    default = "t2.micro"
  
}

variable "ami" {
    description = "this is the AMI ID for the instance"
    type = string

}