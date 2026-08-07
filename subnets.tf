##public subnet####

resource "aws_subnet" "my_public" {
    vpc_id     = aws_vpc.my_vpc.id
    cidr_block = var.pub_subnet_cidr
} 

## private subnet ###


resource "aws_subnet" "my_private"{

    vpc_id = aws_vpc.my_vpc.id
    cidr_block = var.private_subnet_cidr
}


