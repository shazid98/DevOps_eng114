# launch server on aws
provider "aws" {
        region = "eu-west-1"
}
# create a VPC
resource "aws_vpc" "eng114_shazid_terraform" {
  cidr_block = "10.34.0.0/16"
  instance_tenancy = "default"

  tags = {
      Name = "eng114_shazid_vpc"
  }
}

# create a internet gateway

resource "aws_internet_gateway" "eng114_shazid_ig" {
  vpc_id = aws_vpc.eng114_shazid_terraform.id

  tags = {
    Name = "eng114_shazid_terraform_ig"
  }
}

# create a public and a private subnets

resource "aws_subnet" "eng114_shazid_terraform_public_subnet" {
  vpc_id     = aws_vpc.eng114_shazid_terraform.id
  cidr_block = "10.34.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "eu-west-1a"

  tags = {
    Name = "eng114_shazid_terraform_public_subnet"
  }
}

resource "aws_subnet" "eng114_shazid_terraform_private_subnet" {
  vpc_id     = aws_vpc.eng114_shazid_terraform.id
  cidr_block = "10.34.3.0/24"
  map_public_ip_on_launch = false
  availability_zone = "eu-west-1a"

  tags = {
    Name = "eng114_shazid_terraform_private_subnet"
  }
}

# Route table (public)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.eng114_shazid_terraform.id
  tags = {
    Name = "eng114-shazid-terraform-public-RT"
  }
}

# Route from (public)
resource "aws_route" "public_internet_gateway" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.eng114_shazid_ig.id
}


# Subnet associations (public)
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.eng114_shazid_terraform_public_subnet.id
  route_table_id = aws_route_table.public.id
}

# Security Groups
resource "aws_security_group" "app_security_ports" {
  name = "app_ports"
  description = "Allow ports"
  vpc_id = aws_vpc.eng114_shazid_terraform.id

  ingress {
    from_port = 80
    protocol  = "tcp"
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 3000
    protocol  = "tcp"
    to_port   = 3000
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app_ports"
  }
}

resource "aws_security_group" "db_security_ports" {
  name = "db_ports"
  description = "Allow SSH"
  vpc_id = aws_vpc.eng114_shazid_terraform.id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "db_ports"
  }
}

resource "aws_security_group" "controller_security_ports" {
  name = "controller_ports"
  description = "Allow port 80"
  vpc_id = aws_vpc.eng114_shazid_terraform.id

  ingress {
    from_port = 22
    protocol  = "tcp"
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "controller_ports"
  }
}



resource "aws_instance" "controller_instance"{
# choose your ami and instance type
    ami = "${var.node_controller_id}"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    subnet_id = "${aws_subnet.eng114_shazid_terraform_public_subnet.id}"
    vpc_security_group_ids = [aws_security_group.controller_security_ports.id]

# enable a public ip
    associate_public_ip_address = true

# name the instance
    tags = {
        Name = "eng114_shazid_terraform_controller"
    }
}

resource "aws_instance" "db_instance"{
# choose your ami and instance type
    ami = "${var.node_db_id}"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    subnet_id = "${aws_subnet.eng114_shazid_terraform_private_subnet.id}"
    vpc_security_group_ids = [aws_security_group.db_security_ports.id]

# enable a public ip
    associate_public_ip_address = false

# name the instance
    tags = {
        Name = "eng114_shazid_terraform_db"
    }
}
resource "aws_instance" "app_instance"{
# choose your ami and instance type
    ami = "${var.node_app_id}"
    instance_type = "t2.micro"
    key_name = "${var.aws_key_name}"
    subnet_id = "${aws_subnet.eng114_shazid_terraform_public_subnet.id}"
    vpc_security_group_ids = [aws_security_group.app_security_ports.id]

# enable a public ip
    associate_public_ip_address = true

# name the instance
    tags = {
        Name = "eng114_shazid_terraform_app"
    }
}
