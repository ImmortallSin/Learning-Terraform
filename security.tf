#Resource Nginx Security Group
resource "aws_security_group" "nginx_sg" {
  name   = "nginx_sg"
  vpc_id = aws_vpc.tfvpc.id

  #HTTP access form anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  #Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

#Explanation  
#We're creating an "aws_security_group" with the name label "nginx_sg", that allows port 80 traffic from anywhere to talk to our Ec2 instance. 
#We're associating this security group with our VPC, and we are creating a single ingress group using a nested block. 
#Inside the nested ingress block, we are setting the "from" and "to" ports to port 80, the protocol to tcp, and within the "cidr_block" argument we are setting it to all zeros, which alloes traffic from anywhere. 
#The lower egress nested block allows outbound traffic to anywhere. 
