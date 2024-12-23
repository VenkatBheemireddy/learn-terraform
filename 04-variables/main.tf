### Plain Variable
variable "v1" {
  default = "Hello"
}

### List Variable
variable "v2" {
  default = [
  "Hello",
  2,
  false
  ]
}

### Map Variable
variable "v3" {
  default = {
    course = "devops"
    cloud = "azure"
  }
}


### Accessing Variables
output "o1" {
  value = var.v1
}

output "o2" {
  value = "${var.v1} - John"
}

output "o3" {
  value = var.v2[0]
}

output "o4" {
  value = var.v3["cloud"]
}

### Example for terraform.tfvars
variable "v10" {}
output "o10" {
  value = var.v10
}

### Example for other tfvars
variable "env" {}
output "o11" {
  value = var.env
}