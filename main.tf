
terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5.67.0"
        }
    }
    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "web" {
    name        = "blockstellart_sg"
    description = "Security gruop for web server"
    
    ingress {
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }
    
    ingress {
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        }

    egress {

        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "blockstellart" {
    ami           = "ami-0182f373e66f89c85"
    instance_type = "t2.micro"
    key_name      = "blockstellart"
    security_groups = [aws_security_group.web.name]
    tags = {
        Name = "BlockstellartInstance"
    }
}
