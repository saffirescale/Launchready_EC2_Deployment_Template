resource "aws_eip" "this" {
  instance = aws_instance.ec2.id
}
