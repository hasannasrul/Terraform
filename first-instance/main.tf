provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "first-tf-instance" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    tags = {
        Name: "TF-instance"
    }
    key_name = "python-devops"
    user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update
                sudo apt-get install docker.io -y
                sudo systemctl start docker
                sudo systemctl enable docker
                EOF
}
