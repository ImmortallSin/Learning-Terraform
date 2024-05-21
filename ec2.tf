#Resource EC2 instance
resource "aws_instance" "nginx1" {
  ami = nonsensitive(data.aws_ssm_parameter.amzn2_linux.value)
  instance_type = "t3.micro"
  subnet_id = aws_subnet.tfsubnet1.id
  vpc_security_group_ids = [ aws_security_group.nginx_sg.id ]

  user_data = <<EOF
#! /bin/bash
sudo amazon-linux-extras install -y nginx1
sudo service nginx start
sudo rm /usr/share/nginx/html/index.html
echo '<html><head><title>Taco Team Server</title></head><body style=\"background-color:#1F778D\"><p style=\"text-align: center;\"><span style=\"color:#FFFFFF;\"><span style=\"font-size:28px;\">You did it! Have a &#127790;</span></span></p></body></html>' | sudo tee /usr/share/nginx/html/index.html
EOF

}

#Explanation
#We're creating a resource type of "aws_instance" and naming it "nginx1". 
#For the AMI ID, we're referencing our data source, "amzn2_linux". 
#The attribute "instance_type" is self explanatory, it sets the instance type in this instance to "t3.micro". 
#The attribute "subnet_id" will reference the single subnet created "tfsubnet1". 
#The argument "vpc_security_group_ids" is plural, meaning it expects a list of security group IDs. 
#We only have a single security group ID to give it, however, we still need to put that in a list as that's what the argument is expecting. 
#Lists are enclosed in square brackets, and then the elements within the list are separated by commas.
#We only have a single element for the list, which is the security group we created to allow port 80.
