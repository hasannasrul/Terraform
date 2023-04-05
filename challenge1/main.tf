provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "server" {
    ami = "ami-00c39f71452c08778"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.sg.name]
    user_data = file("./server-script.sh") 
    tags = {
        Name = "server"
    }
}

resource "aws_eip" "eip" {
    instance =  aws_instance.server.id
}

variable "ingress" {
  type        = list(number)
  default     = [80,443]
  description = "security group ports"
}

variable "egress" {
  type        = list(number)
  default     = [80,443]
  description = "security group ports"
}

resource "aws_security_group" "sg" {
    name = "Allow web traffic"

    dynamic "ingress" {
        iterator = port
        for_each = var.ingress
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"] 
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egress
        content {
            from_port = port.value
            to_port = port.value
            protocol = "TCP"
            cidr_blocks = ["0.0.0.0/0"] 
        }
    }
}

output "Private_IP" {
    value = aws_instance.server.private_ip
}

output "Public_IP" {
    value =  aws_eip.eip.public_ip
}