resource "aws_s3_bucket" "my_project_bucket" {
    bucket = var.my_s3_bucket
}

resource "aws_instance" "my_project_ec2" {
    ami = "ami-05bfa4a7765f38076"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.my_project_sg.id]

}


