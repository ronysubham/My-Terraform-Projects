resource "aws_autoscaling_group" "web_asg"{

    desired_capacity = 1
    max_size =  2
    min_size = 1
    vpc_zone_identifier = aws_subnet.public[*].id
    target_group_arns = [aws_lb_target_group.app_tg.arn]
    health_check_type = "ELB"
    launch_template {

        id = aws_launch_template.web_template.id
        version = "$Latest" 
    }

    tag {

        key = "Name"
        value = "web_asg_instance"
        propagate_at_launch = true
    }


}        