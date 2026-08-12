variable "my_s3_bucket" {
  description = "The name of the S3 bucket to create"
  type        = string
}

variable "instance_type" {
  default = "t3.micro"
  
}

variable "ami_id" {
  default = "ami-05bfa4a7765f38076"
  
}

variable "project_name" {
  type        = string
  description = "Project name used for AWS resource naming"
  default     = "my-app"
}


variable "asg_min_size"{
  type = number
  default = 1
}

variable "asg_desired_capacity"{
  type = number
  default = 1
}

variable "asg_max_size"{
  type = number
  default = 1

}

variable "aws_region" {
  default= "eu-north-1"
  
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"

}

variable "pub_subnet_cidr"{
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}


variable "ingress_rules_alb" {
  description = "List of ingress rules for my alb-sg"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}