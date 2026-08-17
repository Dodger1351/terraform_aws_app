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



