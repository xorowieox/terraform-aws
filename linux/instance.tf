resource "aws_instance" "rowie-terraform-linux" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = "rowie.sou"
tags = {
        Name = "rowie-terraform-linux"
    }

}

resource "aws_vpc" "vpc-rowie" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "tf-rowie"
    }
  
}

resource "aws_subnet" "subnet-rowie" {
    vpc_id      = aws_vpc.vpc-rowie.id
    cidr_block  = "10.0.1.0/24"
    map_public_ip_on_launch = true
    depends_on = [aws_internet_gateway.gateway]
}

resource "aws_internet_gateway" "gateway" {
    vpc_id = aws_vpc.vpc-rowie.id
  
}

resource "aws_security_group" "allow_traffic" {
    name        = "ssh_traffic"
    description = "allow traffic from ssh"
    vpc_id      = aws_vpc.vpc-rowie.id
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks  = ["24.253.93.244/32"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks  = ["0.0.0.0/0"]
    }

    tags = {
        Name = "Allow SSH"
    }
  
}

resource "aws_network_interface" "server-nif" {
    subnet_id = aws_subnet.subnet-rowie.id
    private_ip = "10.0.1.25"
    security_groups = [aws_security_group.allow_traffic.id]
  
}

