# ---------------------------------
# interface policy
# ---------------------------------
# Snowflake external_volume用
resource "aws_iam_policy" "external_volume" {
  name        = "${local.name}-snowflake-policy"
  policy = templatefile(
    "${local.repo_root}/infra/params/snowflake_integration_policy.json.tpl",
    {
      bucket_name = aws_s3_bucket.iceberg.id
      account_id  = data.aws_caller_identity.current.account_id
    }
  )
}

resource "aws_iam_role" "external_volume" {
  name        = local.aws_role_name
  assume_role_policy = templatefile(
    "${local.repo_root}/infra/params/snowflake_integration_assume_role_policy.json.tpl",
    {
      iam_user_arn = local.external_volume_value["STORAGE_AWS_IAM_USER_ARN"]
      external_ids = [
        local.external_volume_value["STORAGE_AWS_EXTERNAL_ID"],
        "AR29333_SFCRole=2_tzyUKvU4OYa0j8D+P8eETJBUHsw="
        ]
    }
  )
}

resource "aws_iam_role_policy_attachment" "external_volume" {
  role       = aws_iam_role.external_volume.name
  policy_arn = aws_iam_policy.external_volume.arn
}

# firehose
resource "aws_iam_role" "firehose" {
  name        = "${local.name}-firehose"
  assume_role_policy = file(
    "${local.repo_root}/infra/params/firehose_assume_role_policy.json",
  )
}
