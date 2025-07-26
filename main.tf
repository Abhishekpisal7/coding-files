provider "aws" {
 
    region = "ap-south-1"
  
}

variable "ami-id" {
    description = "The AMI ID to use for the instance"
    type        = string
    default     = "ami-0f918f7e67a3323f0"  # Example AMI ID, replace with your own
  
}

variable "instance-value" {
    description = "The type of instance to create"
    type        = string
    default     = "t2.micro"  # Example instance type, replace with your own
  
}

variable "key" {
    description = "The name of the key pair to use for SSH access"
    type        = string
    default     = "newkey"  # Example key pair name, replace with your own
  
}


resource "aws_instance" "test_instance" {
   
    ami           = var.ami-id
    instance_type = var.instance-value
    key_name      = var.key
    
   

    tags = {
        Name = "TestInstance"
        Environment = "DevOps"
        Owner = "Abhishek Pisal"
        instance ="TestInstance-${count.index + 1}"
    }  
  
}


 output "TestInstanceID" {

    value = aws_instance.test_instance.id
    description = "The ID of the test instance"
    }

output "TestInstancePublicIP" {

    value = aws_instance.test_instance.public_ip
    description = "The public IP address of the test instance"
    
}

