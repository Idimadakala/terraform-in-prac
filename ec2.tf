resource "aws_instance" "web" {
  ami           = "ami-080b1a55a0ad28c02"
  instance_type = "t2.medium"
}
