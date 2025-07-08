variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1"
  
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.0.0.0/16"
  
}

variable "public_subnet_cidr" {
    description = "CIDR blocks for the public subnet"
    type        = list(string)
    default     = ["10.0.1.0/24","10.0.2.0/24"]
}

variable "availability_zones" {
    description = "List of availability zones for the public subnets"
    type        = list(string)
    default     = ["us-east-1a", "us-east-1b"]
}

variable "ami_id" {
    description = "AMI ID for the EC2 instance"
    type        = string
      
}

variable "instance_type" {
    description = "Instance type for the EC2 instance"
    type        = string
    default     = "t2.micro"
  
}

variable "key_name" {
    description = "Name of the SSH key pair to use for the EC2 instance"
    type        = string
    
}