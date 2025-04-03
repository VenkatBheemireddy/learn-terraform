provider "vault" {
  # it is strongly recommended to configure this provide through the
  # the environment variables described above, so that each user can
  # have separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
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
