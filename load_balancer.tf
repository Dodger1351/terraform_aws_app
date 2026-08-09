resource "aws_lb" "my-lb" {
  name               = "my-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.my_alb_sg.id]
  subnets            = [aws_subnet.my_public.id]

  enable_deletion_protection = false

  tags = {
    Environment = "production"
  }
}