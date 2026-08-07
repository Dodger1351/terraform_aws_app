resource "aws_nat_gateway" "example" {
  allocation_id                  = aws_eip.my-eip.id
  subnet_id                      = aws_subnet.my_public.id

   tags = {
    Name = "main-nat"
  }

  depends_on = [ aws_internet_gateway.my-igw ]
  
}


