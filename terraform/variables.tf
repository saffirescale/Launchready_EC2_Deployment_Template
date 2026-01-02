variable "aws_region" {}
variable "ami_id" {}
variable "instance_type" {
  default = "t3.micro"
}
variable "key_name" {}
variable "public_key_path" {}
variable "allowed_ssh_cidr" {}
variable "data_volume_size" {
  default = 20
}
