terragrunt_version_constraint = "~> v0.68"

remote_state {
  backend = "s3"
  config = {
    bucket = "dbt-adventcalendar-2024-mukai-tfstate"
    region = "ap-northeast-1"
    key    = "${path_relative_to_include()}/terraform.tfstate"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
