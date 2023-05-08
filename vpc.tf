resource "aws_vpc" "dybran" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "Dybran"
  }
}

resource "aws_subnet" "dybran-pub-1" {
  vpc_id                  = aws_vpc.dybran.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "dybran-pub-1"
  }
}

resource "aws_subnet" "dybran-pub-2" {
  vpc_id                  = aws_vpc.dybran.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "dybran-pub-2"
  }
}

resource "aws_subnet" "dybran-pub-3" {
  vpc_id                  = aws_vpc.dybran.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "dybran-pub-3"
  }
}

resource "aws_subnet" "dybran-priv-1" {
  vpc_id                  = aws_vpc.dybran.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.ZONE1
  tags = {
    Name = "dybran-priv-1"
  }
}

resource "aws_subnet" "dybran-priv-2" {
  vpc_id                  = aws_vpc.dybran.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.ZONE2
  tags = {
    Name = "dybran-priv-2"
  }
}

resource "aws_subnet" "dybran-priv-3" {
  vpc_id                  = aws_vpc.dybran.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = var.ZONE3
  tags = {
    Name = "dybran-priv-3"
  }
}

resource "aws_internet_gateway" "dybran-IGw" {
  vpc_id = aws_vpc.dybran.id
  tags = {
    Name = "dybran-IGw"
  }
}

resource "aws_route_table" "dybran-pub-RT" {
  vpc_id = aws_vpc.dybran.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dybran-IGw.id
  }

  tags = {
    Name = "dybran-pub-RT"
  }
}

resource "aws_route_table_association" "dybran-pub-1-a" {
  subnet_id      = aws_subnet.dybran-pub-1.id
  route_table_id = aws_route_table.dybran-pub-RT.id
}

resource "aws_route_table_association" "dybran-pub-2-b" {
  subnet_id      = aws_subnet.dybran-pub-2.id
  route_table_id = aws_route_table.dybran-pub-RT.id
}

resource "aws_route_table_association" "dybran-pub-3-c" {
  subnet_id      = aws_subnet.dybran-pub-3.id
  route_table_id = aws_route_table.dybran-pub-RT.id
}