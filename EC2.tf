provider "aws" {
        region = "us-east-1"
        access_key = "AKIA5FTZEN7XLR4GFMGD"
        secret_key = "zz+EPXAlZPObN1cxCUeBxLySQGwu1FZ75bDFEP/I"
}
resource "aws_instance" "example_server" {
  ami           = "ami-04e914639d0cca79a"
  instance_type = "t2.micro"

  tags = {
    Name = "1TerraformEC2"
  }
}

