locals {
  aws_role_name     = "${local.name}-snowflake-role"
  name_snow     = replace(upper(local.name), "-", "_")
}
