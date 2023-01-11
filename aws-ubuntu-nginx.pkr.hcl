variable "ami_perfix" {
  type    = string
  default = "test-packer"
}

variable "region" {
  type    = string
  default = "us-west-2"
}

packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu-nginx" {
  ami_name      = "${var.ami_perfix}-ubuntu-nginx"
  instance_type = "t2.micro"
  region        = "${var.region}"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name = "ubuntu-nginx"
  sources = [
    "source.amazon-ebs.ubuntu-nginx"
  ]
  provisioner "shell" {
    inline = [
      "echo Installing nginx",
      "sleep 30",
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl enable nginx",
    ]
  }
}
