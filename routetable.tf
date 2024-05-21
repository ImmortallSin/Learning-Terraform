#Resource Route Table
resource "aws_route_table" "myroutetbl" {
  vpc_id = aws_vpc.tfvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tfgate.id
  }
}

#Explanation
#The provided code defines a resource for creating a route table in an AWS Virtual Private Cloud (VPC). 
#This route table contains a specific route configuration that enables outbound internet access for reosurces within the VPC. 
#The keyword resource indiactes the creation of a new resource within the Terraform configuration. 
#The key value "aws_route_table" specifies the type of resource being created, in this case being an AWS route table. 
#A route table in AWS is used to set up network routes, which specify how packets are routed within the VPC or to external networks. 
#The name label "myroutetbl" is used to assign the route table resource a local name, which can later referenced elsewhere within the terraform configuraiton. 
#The attribute "vpc_id" specifies the ID of the VPC where the route table will be created, this links the route table directly to the VPC. 
#The nested block withint the route tabel resource "route" specifies a routing rule. 
#The key value "cidr_block" is the CIDR block for this route, which represnets all possible IP addresses "0.0.0.0/0". 
#The attribute "gateway_id" specifies the ID of an Internet Gateway attachted to the VPC. This route sends all outbound traffic destined for any IP address to this Internet Gateway, allowing instances within the VPC to access the internet. 





resource "aws_route_table_association" "myroutetbl_subnet1" {
    subnet_id = aws_subnet.tfsubnet1.id
    route_table_id = aws_route_table.myroutetbl.id
}

#Explanation
#The provided code defines a resource for associating a sbunet with a route table within an AWS Virtual Private Cloud (VPC). 
#This association is crucial for determining how traffic is routed from the subnet to other parts of the network or the internet. 
#The keyword resource indicates the creation of a new resource that Terraform will manage. 
#The attribute "aws_route_table_association" specifies the resource we're creating, in this case being a route table association, which is used in AWS to link a subnet to a specific route table.
#The attribute "subnet_id" specifies the ID of the subnet that will be associated with the route table. This subnet will now use the routing rules defined in the associated route table. 
#The attribute "route_table_id" specifies the ID of the route table to which the subnet will be linked to. This route table contains the rules that will dictate how traffic is routed from the assoicated subnet. 
