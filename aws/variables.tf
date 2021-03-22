variable "region" {
    type    = string
    default = "us-east-1"
}

variable "cidr_block" {
    type    = string
    default = "192.168.0.0/24"
}

variable "vpc_name" {
    type    = string
    default = "TerraformVPC"
}

variable "ec2_ami" {
    type    = string
    default = "ami-0c94855ba95c71c99"
}

variable "ec2_type" {
    type    = string
    default = "t2.micro"
}

variable "ingressrules" {
    type    = list(number)
    default = [80, 443]
}

variable "egressrules" {
    type    = list(number)
    default = [80, 443, 25, 3306, 53, 8080]
}