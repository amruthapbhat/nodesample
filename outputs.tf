output "name" {
  value = "${var.client}"
}

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "org_ip" {
  value = "${aws_instance.org.*.public_ip}"
}

output "orderer_ip" {
  value = "${aws_instance.orderer.public_ip}"
}

