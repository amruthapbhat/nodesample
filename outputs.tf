output "name" {
  value = "${var.client}"
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "org0_ip" {
  value = "${aws_instance.org.0.public_ip}"
}

output "org1_ip" {
  value = "${aws_instance.org.1.public_ip}"
}

output "org2_ip" {
  value = "${aws_instance.org.2.public_ip}"
}

output "orderer_ip" {
  value = "${aws_instance.orderer.public_ip}"
}

