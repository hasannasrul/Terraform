provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "first-tf-instance" {
    ami = "ami-007855ac798b5175e"
    instance_type = "t2.micro"
    tags = {
        Name: "TF-instance"
    }
    user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install apache2 -y
                sudo systemctl start apache2
                sudo bash -c 'echo your very first web server > /var/www/html/index.html'
                EOF
}