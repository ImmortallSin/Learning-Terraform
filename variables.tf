variable "aws_access_key" {
  type        = string
  description = "AWS Access Key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret Key"
  sensitive   = true

}

variable "aws_region" {
  type        = string
  description = "AWS region to use for resources"
  default     = "us-east-1"
}

variable "type_of_instance" {
  type        = string
  description = "Type of instance"
  default     = "t3.micro"
}

variable "vpc_cidr" {
  type        = string
  description = "The VPC's cidr block"
  default     = "10.0.0.0/16"
}

variable "vpc_hostname" {
  type        = bool
  description = "Enables DNS hostnames in VPC"
  default     = true
}

variable "subnet_cidr" {
  type        = string
  description = "The subnet's cidr block"
  default     = "10.0.0.0/24"
}

variable "subnet_mapip" {
  type        = bool
  description = "Map a public IP address for Subnet instances"
  default     = true
}

variable "company" {
  type        = string
  description = "Company name for resource tagging"
  default     = "Nebulous"
}

variable "project" {
  type        = string
  description = "Project name for resource tagging"
}

variable "billing_code" {
  type        = string
  description = "Billing code for resource tagging"
}