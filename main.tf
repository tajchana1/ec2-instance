terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_instance" "app" {
  # Ubuntu Server 20.04 LTS 
  ami           = "ami-0dbec48abfe298cab"
  instance_type = "t2.micro"
  user_data = file("userdata.sh")

  tags = {
    Name = "Web Server"
  }
}