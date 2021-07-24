resource "aws_instance" "rowie terraform linux" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
tags = {
        Name = "rowie terraform linux"
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

