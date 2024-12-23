resource "null_resource" "demo" {
  count = length(var.demo)
}

variable "demo" {
  default = [
    "apple",
    "banana"
  ]
}