provider "aws" {
    region = "us-east-1"
    access_key = "AKIA4RKSB7IF7T4ZHZ3N"
    secret_key = "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"
}

resource "aws_vpc" "development-vpc" {
  
    cidr_block = "10.0.0.0/16"
    tags = {
         
          Name: "development"
    }
}
resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone="us-east-1c"
    tags = {
        Name: "subnet-1-dev"
    }
}
data "aws_vpc" "existing_vpc" {
    default = true
}
resource "aws_subnet" "dev-subnet-2" {
    vpc_id = data.aws_vpc.existing_vpc.id
    cidr_block = "172.31.96.0/20"
    availability_zone="us-east-1c"
}
 



