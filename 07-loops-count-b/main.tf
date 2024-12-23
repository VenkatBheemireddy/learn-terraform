terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.5.1"
    }
  }
}

resource "null_resource" "demo" {
  count = length(var.demo)

  provisioner "local-exec" {
    command = "echo ${var.demo[count.index]}"
  }
}

resource "local_file" "foo" {
  count = length(var.demo)
  content = var.demo[count.index]
  filename = "/tmp/file-${count.index}"
}

variable "demo" {
  default = [
    "orange",
    "apple",
    "banana",
    "apricot"
  ]
}