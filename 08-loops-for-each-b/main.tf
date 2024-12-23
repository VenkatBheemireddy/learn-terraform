resource "local_file" "foo" {
  for_each = var.demo
  content = each.value["content"]
  filename = "/tmp/${each.key}"
}

variable "demo" {
  default = {
    BANANA = {
      content = "Banana is a fruit"
    }
    ORANGE = {
      content = "Orange is a fruit"
    }
  }
}