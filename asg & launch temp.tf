resource "aws_launch_template" "app" {
  name_prefix   = var.project_name
  image_id      = var.ami_id
  instance_type = var.instance_type

  iam_instance_profile {
    name = aws_iam_instance_profile.ec2_role.name
  }

  vpc_security_group_ids = [
    aws_security_group.my_project_sg.id
  ]

  user_data = base64encode(<<-EOF
    #!/bin/bash

    set -e

    apt-get update -y

    apt-get install -y docker.io awscli

    systemctl enable docker
    systemctl start docker

    usermod -aG docker ubuntu

    aws ecr get-login-password --region ${var.aws_region} | \
      docker login --username AWS --password-stdin ${aws_ecr_repository.my-ecr.repository_url}

    docker pull ${aws_ecr_repository.my-ecr.repository_url}:latest

    docker stop backend || true
    docker rm backend || true

    docker run -d \
      --name backend \
      --restart unless-stopped \
      -p 3000:3000 \
      ${aws_ecr_repository.my-ecr.repository_url}:latest
  EOF
  )
}

resource "aws_autoscaling_group" "app" {
  name = "my-asg-group"

  min_size         = var.asg_min_size
  desired_capacity = var.asg_desired_capacity
  max_size         = var.asg_max_size

  vpc_zone_identifier = [
    aws_subnet.my_private.id
  ]

  target_group_arns = [
    aws_lb_target_group.my_tg.arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 120

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }
}