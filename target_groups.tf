# Target Group
resource "aws_lb_target_group" "my_tg" {
  name     = "app-target-group"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = aws_vpc.my_vpc.id

  health_check {
    path = "/health"
  }

  tags = {
    Name = "app-target-group"
  }
}


#EC2 with Target Group
resource "aws_lb_target_group_attachment" "ec2_tg" {
  target_group_arn = aws_lb_target_group.my_tg.arn
  target_id        = aws_instance.my_project_ec2.id
  port             = 3000
}

