
resource "aws_vpc" "dev-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "dev-vpc"
    }
}

resource "aws_subnet" "dev-vpc-subnet-1" {
    vpc_id = aws_vpc.dev-vpc.id
    cidr_block = "10.0.10.0/24"
    availability_zone = "us-east-1a"
    tags = {
        Name = "dev-vpc-subnet-1"
    }
}

data "aws_vpc" "existing-default-vpc" {
    default = true
}

resource "aws_subnet" "existing-vpc-subnet" {
    cidr_block = "172.31.96.0/20"
    vpc_id = data.aws_vpc.existing-default-vpc.id
    availability_zone = "us-east-1b"
    tags = {
        Name = "existing-vpc-subnet-1"
    }
}

output "dev-vpc-id" {
    value = aws_vpc.dev-vpc.id
}

output "default-vpc-id" {
    value = data.aws_vpc.existing-default-vpc.id
}