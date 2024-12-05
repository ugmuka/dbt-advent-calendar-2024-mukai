resource "snowflake_external_volume" "s3" {
  provider = snowflake.accountadmin
  name = "${local.name_snow}_S3_VOLUME"
  storage_location {
    storage_base_url = "s3://${aws_s3_bucket.iceberg.id}/"
    storage_location_name = "${local.name_snow}_STORAGE_LOCATION"
    storage_provider = "S3"
    storage_aws_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${local.aws_role_name}"
  }
}

locals {
  # v0.99だとexternal valumeのattributeがないので一旦これで代用
  external_volume_value = jsondecode(
    lookup([
      for i in snowflake_external_volume.s3.describe_output : i if i["name"] == "STORAGE_LOCATION_1"][0]
      , "value")
  )
}
