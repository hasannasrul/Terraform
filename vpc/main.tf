provider "aws" {
    region = "us-east-1"
}

resource "aws_vpc" "tfvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "terraform_VPC"
    }
}

output "vpc_arn" {
  value       = aws_vpc.tfvpc.arn
  description = "description"
}

resource "aws_subnet" "subnet1" {
    vpc_id = aws_vpc.tfvpc.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "public-subnet-1"
    }

}

resource "aws_subnet" "subnet2" {
    vpc_id = aws_vpc.tfvpc.id
    cidr_block = "10.0.16.0/20"
    tags = {
        Name = "public-subnet-1"
    }

}