provider "vault" {
  # It is strongly recommended to configure this provider through the
  # environment variables described above, so that each user can have
  # separate credentials set in the environment.
  #
  # This will default to using $VAULT_ADDR
  # But can be set explicitly
  address = "http://vault.azdevopsv82.online:8200"
  token   = var.token
}

variable "token" {}

### Method - 1 to get the secret using local_file resource

data "vault_kv_secret" "secret_data" {
  path = "test/data/demo-ssh"
}

resource "local_file" "full" {
  filename = "/tmp/pass"
  content = data.vault_kv_secret.secret_data.data
  #content = replace(replace(jsonencode(data.vault_kv_secret.secret_data), "\"", ""), ":", "=")
}

# Execution:
# git pull
# terraform init
# Output: Along with the Password, this output will give more information


