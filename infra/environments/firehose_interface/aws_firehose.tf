resource "aws_kinesis_firehose_delivery_stream" "s3_iceberg" {
  name        = "${local.name}-firehose"
  destination = "iceberg"

  iceberg_configuration {
    role_arn           = aws_iam_role.firehose.arn
    catalog_arn        = "arn:${data.aws_partition.current.partition}:glue:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:catalog"
    buffering_size     = 10
    buffering_interval = 400

    s3_configuration {
      role_arn   = aws_iam_role.firehose.arn
      bucket_arn = aws_s3_bucket.iceberg.arn
    }
  }
}
