# resource "aws_instance" "my_instance" {
#     ami             = var.ec2_ami
#     instance_type   = var.ec2_type
#     security_groups = [aws_security_group.webtraffic.name]
# }
