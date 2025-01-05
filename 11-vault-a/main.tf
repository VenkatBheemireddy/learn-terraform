provider "vault" {
  address = "http://vault.azdevopsv82.online:8200"
  token   = var.token
}

variable "token" {}

data "vault_generic_secret" "secret_data" {
  path = "test/demo-ssh"
}

resource "local_file" "local" {
  filename = "/tmp/pass"
  content  = data.vault_generic_secret.secret_data.data["password"]
}
