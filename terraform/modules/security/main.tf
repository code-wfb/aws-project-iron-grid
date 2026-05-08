# Gateway Load Balancer (Slide 7)
resource "aws_lb" "security_gwlb" {
  name               = "irongrid-gwlb"
  load_balancer_type = "gateway"
  subnets            = var.subnet_ids # IDs vindos do módulo network
}

# Target Group GENEVE para Appliances de Segurança
resource "aws_lb_target_group" "gwlb_tg" {
  name     = "irongrid-tg-geneve"
  port     = 6081
  protocol = "GENEVE"
  vpc_id   = var.vpc_id
}

# Security Group "Zero Trust" para as instâncias
resource "aws_security_group" "core_sg" {
  name        = "irongrid-core-sg"
  description = "Regras restritivas IronGrid"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"] # Apenas tráfego interno/VPN/DX
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}