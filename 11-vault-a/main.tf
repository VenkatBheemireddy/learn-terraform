provider "vault" {
  address = "http://vault.azdevopsv82.online:8200"
  token   = var.token
}

variable "token" {}

data "vault_kv_secret" "secret_data" {
  path = "test/data/demo-ssh"
}

resource "local_file" "full" {
  filename = "/tmp/pass"
# content = data.vault_kv_secret.secret_data.data
  content = replace(replace(jsonencode(data.vault_kv_secret.secret_data), "\"", ""), ":", "=")
}
