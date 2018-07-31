resource "aws_vpc" "main" {
  cidr_block = "${var.vpc["cidr_block"]}"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  
  tags {
    Name              = "${var.client}-vpc"
	}
}

resource "aws_internet_gateway" "internet_gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "${var.client}-Internet-Gateway"
  }
}

resource "aws_subnet" "public" {
  depends_on        = ["aws_vpc.main"]
  cidr_block        = "${cidrsubnet(var.vpc["cidr_block"], 8, 148)}"
  vpc_id            = "${aws_vpc.main.id}"
  availability_zone = "${var.region}${var.availability_zone["zone1"]}"

  tags {
    Name              = "${var.client}-zone1-${var.availability_zone["zone1"]}"
      }
}