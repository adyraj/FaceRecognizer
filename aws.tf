provider "aws" {
	region = "ap-south-1"
	profile="aditya"
}

#Launch EC2 instance
resource "aws_instance" "os1" {
  ami           = "ami-010aff33ed5991201"
  instance_type = "t2.micro"

  tags = {
    Name = "myfirstos1"
  }
}

#Create EBS Volume
resource "aws_ebs_volume" "st1" {
  availability_zone = aws_instance.os1.availability_zone
  size              = 2

  tags = {
    Name = "EBS Volume"
  }
}

#Attach EBS Volume to instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.st1.id
  instance_id = aws_instance.os1.id
}