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

###Method - 2 to get the secret.

data "vault_generic_secret" "secret_data" {
  path = "test/demo-ssh"
}

resource "local_file" "local" {
  filename = "/tmp/pass"
  content  = data.vault_generic_secret.secret_data.data["password"]
}

# Execution:
# git pull
# terraform init
# terraform apply -auto-approve -var token=<root-pwd>
# Output: Only the password will be printed





