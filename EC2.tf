resource "aws_instance" "myinstance" {
  ami           = "ami-01b799c439fd5516a"
  instance_type = "t2.micro"

  tags = {
    Name = "1TerraformEC2"
  }
}

