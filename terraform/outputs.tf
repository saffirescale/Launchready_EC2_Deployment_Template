output "elastic_ip" {
  value = aws_eip.this.public_ip
}

output "data_volume_id" {
  value = aws_ebs_volume.data.id
}
