#Resource VPC
resource "aws_vpc" "tfvpc" {
  cidr_block = var.vpc_cidr
  enable_dns_hostnames = var.vpc_hostname

  tags = local.common_tags
}

#Explanaiton
#The keyword resource declares a new resource that Terraform will manage.
#The label "aws_key" specifies the type of resource to create, in this case, it's an AWS VPC managed using the AWS provider Terraform. 
#The name label "tfvpc" is the local named I've assigned to this specific instance of the resource. 
#The key value inside the block "cidr_block", or attribute, defines the IP address range for the VPC in CIRD notation. 
#The key value inside the block "enable_dns_hostnames", or attribute, is set to true, enabling instances launched in this VPC to recieve DNS hostnames. 

resource "aws_internet_gateway" "tfgate" {
  vpc_id = aws_vpc.tfvpc.id

  tags = local.common_tags
}

#Explanation
#The provided code defines a resource for creating an Internet Gateway (IGW) in an AWS Virtual Private Cloud (VPC).
#The keyword resource indiactes the creation of a new resource within the Terraform configuration. 
#The key value, or attribute "aws_internet_gateway" specifies the type of resource we're creating, in this case an Internet Gateway.
#The key value "vpc_id", or attribute, specifies the ID of the VPC where the Internet Gateway will be attached. This establishes a direct association, attaching the Internet Gateway to the specified VPC. 
#This configuration instructs AWS to create an Internet Gateway and attach it to the specified VPC "tfvpc". The Internet Gateway serves as a routing target internet-routable traffic from the VPC. 


resource "aws_subnet" "tfsubnet1"{
    cidr_block = var.subnet_cidr
    vpc_id = aws_vpc.tfvpc.id
    map_public_ip_on_launch = var.subnet_mapip

    tags = local.common_tags
}

#Explanation
#The provided code above defines a resource for creating a subnet within an AWS Virtual Private Cloud (VPC). 
#The keyword resource declares a new resource that Terraform will manage. 
#The key value "cidr_bloc", or attribute, defines the IP address range for the subnet in the CIDR notation.
#The key value "vpc_id", this is the ID of the VPC in which the subnet will reside. This establishes a relationship where the subnet is a component within the VPC. 
#The key value "map_public_ip_on_launch" is set to true, this attribute enables the automatic assignment of a public IP address to instances launched in this subnet. 

#Summary
#This configuration tells AWS to create a new subnet withina an exisiting VPC.
#The subnet will have a specific IP range and will automatically assign public IP addresses to new instances launched within it. 
#Making it suitable for hosting services that need to be accessible from the internet. 
