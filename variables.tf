variable "my_s3_bucket" {
  description = "The name of the S3 bucket to create"
  type        = string
}

variable "ingress_rules" {
  description = "List of ingress rules for my SG"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}


variable " vpc_cidr"{
  default = "10.0.0.0/16"

}

variable "pub_subnet_cidr"{
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  default = "10.0.2.0/24"
}