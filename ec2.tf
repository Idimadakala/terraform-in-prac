resource "aws_instance" "web" {
  ami           = "ami-07a6f770277670015"
  instance_type = "t2.medium"
}
