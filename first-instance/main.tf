provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "first-tf-instance" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    tags = {
        Name: "TF-instance"
    }
    # to stop instance use stp in below line and to start use start in below line
    instance_initiated_shutdown_behavior = "stop"
    key_name = "python-devops"
    user_data = <<-EOF
                #!/bin/bash
                sudo apt-get update
                sudo apt-get install docker.io -y
                sudo systemctl start docker
                sudo systemctl enable docker
                sudo apt-get install nginx -y
                EOF
}

output ip {
  value       = aws_instance.first-tf-instance.public_ip
}
