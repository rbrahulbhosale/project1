provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "app_with_GitHuActions" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.medium"
  key_name      = "mykey"
  vpc_security_group_ids = [aws_security_group.allow_8089.id]

  tags = {
    Name = "Go_Rest_API"
  }
}

resource "aws_security_group" "allow_8089" {
  name        = "allow_8089_with_GitHuActions"
  description = "Allow TCP on port 8089"
  

  ingress {
    from_port   = 8089
    to_port     = 8089
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
