terragrunt_version_constraint = "~> v0.68"

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = file("provider.hcl")
}

include "root" {
  path = "${get_repo_root()}/infra/environments/terragrunt.hcl"
}

include "global_variables" {
  path = "${get_repo_root()}/infra/environments/global_variables.hcl"
}
