resource "aws_vpc_endpoint_service" "privatelink" {
  acceptance_required        = false
  network_load_balancer_arns = [aws_lb.privatelink.arn]
}

# firehoseからの接続を許可
resource "aws_vpc_endpoint_service_allowed_principal" "firehose" {
  vpc_endpoint_service_id = aws_vpc_endpoint_service.privatelink.id
  principal_arn           = "firehose.amazonaws.com"
}
