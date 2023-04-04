provider "aws" {
    region = "us-east-1"
}

# 1. create a ec2 server and output the private ip 
# 2. Create a webserver and ensure it has fixed public ip address
# 3. run server-script.sh inside instance
resource "aws_instance" "web_server" {
    ami = "ami-016eb5d644c333ccb"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.sg_ws01.name]
    tags = {
        Name = "web_server"
    }
    user_data = file("server-script.sh")
}

resource "aws_eip" "ws01-eip" {
    instance = aws_instance.web_server.id
}

output "ws01_eip" {
    value = aws_eip.ws01-eip.public_ip
}

output "prvt_ip" {
    value = aws_instance.web_server.private_ip
}

# 4. create a security group for the webserver opening ports 80 and 443

resource "aws_security_group" "sg_ws01" {
    name = "sg_for_webserver"
    ingress {
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
    }
    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
    }
    tags = {
        Name = "sg_ws01"
    }
}