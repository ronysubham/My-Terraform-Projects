resource "aws_launch_template" "web_template" {
    name_prefix = "web-lt"
    image_id = var.ami_id
    instance_type = var.instance_type

    vpc_security_group_ids = [aws_security_group.ec2_sg.id]
    user_data = base64encode(<<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Server from Auto Scaling Group</h1>" > /var/www/html/index.html
              EOF
  )
}