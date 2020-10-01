data "terraform_remote_state" "domain" {
  backend = "pg"

  workspace = length(split(".", var.parent_blocks.domain)) == 3 ? replace(var.parent_blocks.domain, ".", "-") : "${var.stack_name}-${var.env}-${var.parent_blocks.domain}"

  config = {
    conn_str    = var.backend_conn_str
    schema_name = var.owner_id
  }
}

// We will need to be able to support secondary providers since the root domain
//   is typically managed in a separate account from non-production environments
provider "aws" {
  access_key = data.terraform_remote_state.domain.outputs.delegator["access_key"]
  secret_key = data.terraform_remote_state.domain.outputs.delegator["secret_key"]

  alias = "domain"
}

locals {
  domain_name    = data.terraform_remote_state.domain.outputs.name
  domain_zone_id = data.terraform_remote_state.domain.outputs.zone_id
}
