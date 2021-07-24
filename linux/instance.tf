resource "aws_instance" "rowie-terraform-linux" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = "rowie.sou"
tags = {
        Name = "rowie-terraform-linux"
    }

}
