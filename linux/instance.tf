resource "aws_instance" "Rowie Terraform Linux" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
tags = {
        Name = "Rowie Terrafrom Linux"
    }

}

© 2021 GitHub, Inc.
Terms
Privacy
Security
Status
Docs
Contact GitHub
Pricing
API
Training
Blog
About

