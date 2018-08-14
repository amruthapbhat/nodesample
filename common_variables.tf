provider "aws" {
  region = "${var.region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "count" {}
variable "ami" {}
variable "region" {}

variable "client" {
  description = "Name of the client"
  #TO DO: Find a way to update this based on Client Name
  default = "BC"
}

variable "env" {
  default = "devops"
}

variable "vpc" {
  description = "VPC Vars"

  default = {
    cidr_block = "10.6.0.0/16"
    cidr_half  = "10.6"
  }
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


