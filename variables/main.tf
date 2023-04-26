provider "aws" {
    region = "us-east-1"
}

# variable to initialize string
variable "vpcname" {
  type        = string
  default     = "hasanops"
  description = "VPC name for my organiztion"
}

# variable to initialize int
variable "sshport" {
  type        = number
  default     = 22
  description = "port for ssh connection"
}

# variable to initialize boolean
variable "enabled" {
  default     = true
}

# variable to initialize array. Note - datatype should be same 
variable "mylist" {
  type        = list(string)
  default     = ["value1", "value2"]
}

# variable to initialize dictionary
variable "mymap" {
  type        = map
  default     = {
    key1 = "value1"
    key2 = "value2"
  }
}

# take input from user and set it to variable
variable "inputname" {
    type = string
    description = "Enter VPC Name: "
}

# used above variables in this vpc example
resource "aws_vpc" "my-vpc" {
  cidr_block = "10.0.0.0/16"

#       tags = {
#     Name = var.vpcname
#   }

#   tags = {
#         Name = var.mylist[0]
#     }

    # tags = {
    #     Name = var.mymap["Key1"]
    # }

    tags = {
        Name = var.inputname
    }
    
}

# output variables
output "vpcid" {
  value       = aws_vpc.my-vpc.id
}
