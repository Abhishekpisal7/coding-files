provider "aws" {
  region = "ap-south-1"
}

variable "ami_id" {
    description = "value of ami-id"
    type = string
    default = "ami-0d0ad8bb301edb745"
  
}

variable "instance_type" {
    description = "value od instance type"
    type = string
    default ="t2.micro"
  
}

variable "key_name" {
    description = "value of key name"
    type = string
    default = "newkey" 
}

resource "aws_instance" "terraform-instance" {

    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name 

    tags = {
        Name = "Terraform-Instance"
        Environment = "DevOps"
        Owner = "Abhishek Pisal"
    }

}

output "instance-id" {

    value = aws_instance.terraform-instance.id
    description = "ID of the created terraform-instance"

}

output "public-ip" {

    value =aws_instance.terraform-instance.public_ip
    description = "Public IP of the created terraform-instance"

}