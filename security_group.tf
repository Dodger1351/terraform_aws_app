resource "aws_security_group" "my_project_sg" {
  name        = "my_project_sg"
  description = "Security group for my project"

  ingress {
    from_port                = 80
    to_port                  = 80
    protocol                 = "tcp"
    security_groups = [aws_security_group.my_alb_sg.id]
  }

  ingress {
    from_port                = 443
    to_port                  = 443
    protocol                 = "tcp"
    security_groups= [aws_security_group.my_alb_sg.id]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "my_alb_sg" {
  name        = "my_alb"
  description = "Security group for my project"

  dynamic "ingress" {
    for_each = var.ingress_rules_alb
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


