resource "aws_security_group" "alb_sg" {
    name = "alb_sg"
    description = "Allow HTTP from internet"
    vpc_id = aws_vpc.main.id
    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress{
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    

    }


}

resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    vpc_id = aws_vpc.main.id
    description = "Allow traffic from ALB"
    ingress {

        from_port = 80
        to_port =80
        protocol = "tcp"
        security_groups = [aws_security_group.alb_sg.id]


    }

    egress {
        from_port = 0
        to_port =0 
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
        
    }
}