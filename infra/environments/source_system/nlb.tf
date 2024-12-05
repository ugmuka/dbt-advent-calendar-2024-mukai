resource "aws_lb_target_group" "privatelink_tg" {
  name        = "${local.name}-privatelink-tg"
  port        = 3306
  protocol    = "TCP"
  target_type = "ip"
  vpc_id      = aws_vpc.main.id
}

resource "aws_lb" "privatelink" {
  name               = "${local.name}-privatelink-lb"
  internal           = false
  load_balancer_type = "network"
  subnets            = [
    aws_subnet.private_a.id,
    aws_subnet.private_c.id,
  ]
  security_groups = [
    aws_security_group.privatelink_sg.id
  ]

  enable_deletion_protection = true

}

resource "aws_lb_listener" "privatelink" {
  load_balancer_arn = aws_lb.privatelink.arn
  port              = "3306"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.privatelink_tg.arn
  }
}
