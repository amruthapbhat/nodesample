resource "aws_instance" "org1" {
  ami = ami-c6cff2a9
  instance_type = "${var.organization["instance_type"]}"
  key_name = "${aws_key_pair.blockchainkey.key_name}"
  subnet_id = "${aws_subnet.public.id}"
  private_ip = "${var.vpc["cidr_half"]}.148.10"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.blockchain.id}"]
  
  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.organization["volume_size"]}"
  }
  
  provisioner "remote-exec" {
    inline = [
	  "cd /home/ubuntu/fabric-starter"
	  "ip=`terraform output org1_ip | tr -d ' '`
	  "sed -i 's/###ORG_1###/$ip/g' /home/ubuntu/fabric-starter/network.sh
	  "./network.sh -m generate-peer -o a"
	]
  }
  
  tags {
    Name = ${var.client}-org1
}

resource "aws_instance" "org2" {
  ami = ami-c6cff2a9
  instance_type = "${var.organization["instance_type"]}"
  key_name = "${aws_key_pair.blockchainkey.key_name}"
  subnet_id = "${aws_subnet.public.id}"
  private_ip = "${var.vpc["cidr_half"]}.148.10"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.blockchain.id}"]
  
  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.organization["volume_size"]}"
  }
  
  provisioner "remote-exec" {
    inline = [
	  "cd /home/ubuntu/fabric-starter"
	  "ip=`terraform output org2_ip | tr -d ' '`
	  "sed -i 's/###ORG_2###/$ip/g' /home/ubuntu/fabric-starter/network.sh
	  "./network.sh -m generate-peer -o a"
	]
  }
  
  tags {
    Name = ${var.client}-org2
}

resource "aws_instance" "org3" {
  ami = ami-c6cff2a9
  instance_type = "${var.organization["instance_type"]}"
  key_name = "${aws_key_pair.blockchainkey.key_name}"
  subnet_id = "${aws_subnet.public.id}"
  private_ip = "${var.vpc["cidr_half"]}.148.10"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.blockchain.id}"]
  
  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.organization["volume_size"]}"
  }
  
  provisioner "remote-exec" {
    inline = [
	  "cd /home/ubuntu/fabric-starter"
	  "ip=`terraform output org3_ip | tr -d ' '`
	  "sed -i 's/###ORG_3###/$ip/g' /home/ubuntu/fabric-starter/network.sh
	  "./network.sh -m generate-peer -o a"
	]
  }
  
  tags {
    Name = ${var.client}-org3
}

resource "aws_instance" "orderer" {
  ami = ami-c6cff2a9
  instance_type = "${var.organization["instance_type"]}"
  key_name = "${aws_key_pair.blockchainkey.key_name}"
  subnet_id = "${aws_subnet.public.id}"
  private_ip = "${var.vpc["cidr_half"]}.148.10"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${aws_security_group.blockchain.id}"]
  
  root_block_device {
    volume_type = "gp2"
    volume_size = "${var.organization["volume_size"]}"
  }
  
  provisioner "remote-exec" {
    inline = [
	  "cd /home/ubuntu/fabric-starter/"
	  "./network.sh -m generate-orderer"
	  "./network.sh -m up-orderer"
	]
  }
  
  tags {
    Name = ${var.client}-orderer
}