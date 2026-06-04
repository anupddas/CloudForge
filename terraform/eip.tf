resource "aws_eip" "web" {

  domain = "vpc"

  instance = aws_instance.web.id

  tags = {
    Name = "cloudforge-web-eip"
  }
}