####PUBLIC ROUTE TABLE#####
resource  "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "public-rt"
    }
    
}


#####PRIVATE ROUTE TABLE######

resource  "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "public-rt"
    }
    
}