resource "aws_instance" "org" {
  count = 3
  ami = "${var.ami}"
  instance_type = "${var.organization["instance_type"]}"
  key_name = "elastic"
  subnet_id = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.blockchain.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.organization["volume_size"]}"
  }

  tags {
    Name = "${var.client}-org${count.index}"
   }
}

resource "aws_instance" "orderer" {
  ami = "${var.ami}"
  instance_type = "${var.organization["instance_type"]}"
  key_name = "elastic"
  subnet_id = "${aws_subnet.public.id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.blockchain.id}"]

  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.organization["volume_size"]}"
  }

  tags {
    Name = "${var.client}-orderer"
   }
}