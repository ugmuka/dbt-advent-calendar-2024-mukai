resource "aws_s3_bucket" "iceberg" {
  bucket = "${local.name}-iceberg"
}
