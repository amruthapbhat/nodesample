output "name" {
  value = "${var.client}"
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "org1_ip" {
  value = "${aws_instance.org1.public_ip}"
}

output "org2_ip" {
  value = "${aws_instance.org2.public_ip}"
}

output "org3_ip" {
  value = "${aws_instance.org3.public_ip}"
}

