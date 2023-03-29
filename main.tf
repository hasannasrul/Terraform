provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "first-tf-instance" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    tags = {
        Name: "TF-instance"
    }
}