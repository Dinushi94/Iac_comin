resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "comin_vpc"
  }
}

# Setup AWS Public Subnet
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-west-2a"

  tags = {
    Name = "comin-public"
  }
}

# Setup AWS Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "comin_igw"
  }
}

# Setup Route Table
resource "aws_route_table" "rt-public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "comin_public_rt"
  }
}

# Add a Route to Internet Gateway (0.0.0.0/0 for all traffic)
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.rt-public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.gw.id
}

# Associate the Public Subnet with the Public Route Table
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.rt-public.id
}
