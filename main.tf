#Providers Block
provider "aws" {
  shared_config_files = [ "~/.aws/config" ]
  shared_credentials_files = [ "~/.aws/credentials" ]
  region = "us-east-1"
  profile = "zuko"
}

#Explanation
#The keyword provider followed by the label "aws" declares that Terraform will use the AWS provider plugin to manage resources.
#The key values within the block, "access_key" and "secret_key" are used to provide Terraform with the neccessary access keys in order to authenticatw with AWS.  
#The key value "region = "us-east-1"" specifies the AWS region where Terraform will deploy resources, in this case being "us-east-1". 
#The key value "profile" specifies the named profile that Terraform will use to obtain AWS credentials, in this case being "zuko". 
#It's not recommended to hardcode access keys dierctly within the Terraform configurations, instead it's better to rely on named profiles, environment variables, IAM roles or other AWS services that support roles. 
