#Data Block

data "aws_ssm_parameter" "amzn2_linux" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

#Explanation
#The keyword "data" is used to declare a data source, which is a way to query information from a provider or external resources, which can then be used elsehwere in your Terraform configuration.
#Data sources allow Terraform to use information defined outside of Terraform, or defined by another seperate Terraform configuraiton.
#The label "aws_ssm_parameter" specifies the type of data source we're querying. In this case, an AWS Systems Manager (SSM) parameter.
#The name label "amzn2_linux" is the unique identifer we've assigned the data source in order to easily reference the object elsewhere within the Terraform configuration. 
#Within the block the key value "name" follwed by the string specifies the parameter to fetch from SSM. This parameter typically stores the AMI ID of the latest AMazon Linux 2 AMI, therefore it can be used to launch new EC2 instances with the latest Amazon Linux 2 image.

data "aws_region" "currentregion" {
  name = "us-east-1"
}

#Explanation
#The data source "aws_region" specifies the type of data source we're querying. In this case an AWS region. 
#This data block queries information from the AWs region "us-east-1", enabling this terraform configuration to access details specifc to this region. 
#Attributes of this data source can be referenced eleswhere within the configuration to give use to this quereied informaiton specific to the AWS region "us-east-1".check "
