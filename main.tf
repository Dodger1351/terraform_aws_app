resource "aws_s3_bucket" "my_project_bucket" {
    bucket = var.my_s3_bucket
}

resource "aws_instance" "my_project_ec2" {
    ami = var.ami_id.id
    instance_type = var.instance_type.id
    vpc_security_group_ids = [aws_security_group.my_project_sg.id]
    subnet_id = aws_subnet.my_private.id

}


