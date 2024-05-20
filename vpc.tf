#Resource VPC
resource "aws_vpc" "tfvpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "tfgate" {
  vpc_id = aws_vpc.tfvpc.id
}

resource "aws_subnet" "tfsubnet1"{
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.tfvpc.id
    map_public_ip_on_launch = true
}