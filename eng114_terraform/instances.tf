# Controller instance
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

# DB instance
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

# App Instance
# resource "aws_instance" "app_instance"{

#     ami = "${var.node_app_id}"
#     instance_type = "t2.micro"
#     key_name = "${var.aws_key_name}"
#     subnet_id = "${aws_subnet.eng114_shazid_terraform_public_subnet.id}"
#     vpc_security_group_ids = [aws_security_group.app_security_ports.id]

#     # enable a public ip
#     associate_public_ip_address = true

#     # name the instance
#     tags = {
#         Name = "eng114_shazid_terraform_app"
#     }
# }