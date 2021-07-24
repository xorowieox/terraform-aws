resource "aws_instance" "rowie-terraform-windows" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = "rowie.sou"
tags = {
        Name = "Rowie Windows Terraform"
    }

}

