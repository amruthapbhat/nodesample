provider "aws" {
  region = "ap-south-1"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}

resource "aws_key_pair" "blockchainkey" {
  key_name   = "${var.client}-key"
  public_key = "${file("./ssh_key/###SSH_KEY_NAME###.pub")}"
}

variable "private_key" {
  default = "./ssh_key/###SSH_KEY_NAME###"
}

variable "pub_key" {
  default = "./ssh_key/###SSH_KEY_NAME###.pub"
}

variable "client" {
  description = "Name of the client"
  #TO DO: Find a way to update this based on Client Name
  default = "###CLIENT###"
}

variable "env" {
  default = "devops"
}

variable "vpc" {
  description = "VPC Vars"

  default = {
    cidr_block = "###IP_RANGE###.0.0/16"
    cidr_half  = "###IP_RANGE###"
  }
}

variable "region" {
  type        = "string"
  description = "AWS Region"
  default     = "###AWS_LOCATION###"
}

variable "availability_zone" {
  default = {
    zone1 = "a"
    zone2 = "b"
  }
}

variable "organization" {
  default = {
    volume_size   = 20
    instance_type = "t2.large"
    Service = "Blockchain"
    ServiceComponent = "Blockchain"
    NetworkTier = "Public"
  }
}

}