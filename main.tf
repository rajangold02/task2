provider "aws" {
        region     = "${var.region}"
}
resource "aws_vpc" "My_VPC" {
  cidr_block           = "${var.vpccidrblock}"
  instance_tenancy     = "${var.instanceTenancy}" 
  enable_dns_support   = "${var.dnssupport}" 
  enable_dns_hostnames = "${var.dnshostnames}"
tags {
    Name = "My custom VPC"
  }
} 

resource "aws_subnet" "my_public_subnet" {
  vpc_id                  = "${aws_vpc.my_vpc.id}"
  cidr_block              = "${var.subnetcidrblock}"
  map_public_ip_on_launch = "${var.mappublicip}" 
  availability_zone       = "${var.availabilityZone}"
tags = {
   Name = "My Public Subnet"
  }
}
resource "aws_subnet" "my_private_subnet" {
  vpc_id                  = "${aws_vpc.my_vpc.id}"
  cidr_block              = "${var.subnetcidrblock}"
  map_public_ip_on_launch = "${var.mappublicip}" 
  availability_zone       = "${var.availabilityZone}"
tags = {
   Name = "My Private Subnet"
  }
} 

resource "aws_internet_gateway" "my_vpc_gw" {
  vpc_id = "${aws_vpc.my_vpc.id}"
tags {
        Name = "My VPC Internet Gateway"
    }
} 
resource "aws_eip" "nat_eip" {
  vpc      = true
}
resource "aws_nat_gateway" "natgw" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${aws_subnet.my_public_subnet.id}"

}

resource "aws_route_table" "my_public_route_table" {
    vpc_id = "${aws_vpc.my_vpc.id}"
tags {
        Name = "My public Route Table"
    }
}
resource "aws_route_table" "my_private_route_table" {
    vpc_id = "${aws_vpc.my_vpc.id}"
tags {
        Name = "My private Route Table"
    }
} 

resource "aws_route" "my_vpc_internet_access" {
  route_table_id        = "${aws_route_table.my_public_route_table.id}"
  destination_cidr_block = "${var.destinationcidrblock}"
  gateway_id             = "${aws_internet_gateway.my_vpc_gw.id}"
}

resource "aws_route_table_association" "my_vpc_association" {
    subnet_id      = "${aws_subnet.my_public_Subnet.id}"
    route_table_id = "${aws_route_table.my_public_route_table.id}"
}
resource "aws_route_table_association" "my_vpc_association" {
    subnet_id      = "${aws_subnet.my_private_Subnet.id}"
    route_table_id = "${aws_route_table.my_private_route_table.id}"
}