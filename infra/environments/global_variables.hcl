generate "global_variables" {
  path      = "global_variables.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
locals {
  aws_region = "ap-northeast-1"
  repo_root  = "${get_repo_root()}"
  name    = "mukai-dev"
}
EOF
}
