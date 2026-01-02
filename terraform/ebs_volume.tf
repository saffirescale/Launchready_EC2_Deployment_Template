resource "aws_ebs_volume" "data" {
  availability_zone = aws_instance.ec2.availability_zone
  size              = var.data_volume_size

  tags = {
    Name = "launchready-data"
  }
}
