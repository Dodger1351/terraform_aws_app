####PUBLIC ROUTE TABLE#####
resource  "aws_route_table" "public-rt" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "public-rt"
    }
    
}


### PUBLIC ROUTES ###### ## IGW to INTERNET###

resource "aws_route" "public_net" {
    route_table_id = aws_route_table.public-rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-igw.id
}

## ASSOCIATE PUBLIC ROUTE TABLE #####

resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.my_public.id
    route_table_id =  aws_route_table.public-rt.id 

}

#####PRIVATE ROUTE TABLE######

resource  "aws_route_table" "private-rt" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
        Name = "public-rt"
    }
    
}


##### ROUTE TABLE NAT ----> INTERNET ######

resource "aws_route" "private_net" {
    route_table_id = aws_route.private-rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
}

###ASSOCIATE PRIVATE ROUTE TO SUBNET ######

resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.my_private.id
    route_table_id = aws_route_table.private-rt.id
  
}