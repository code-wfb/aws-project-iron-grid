# VPC Principal
resource "aws_vpc" "irongrid_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags                 = { Name = "${var.project_name}-VPC" }
}

# Internet Gateway (Necessário para o Inbound do GWLB)
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.irongrid_vpc.id
  tags   = { Name = "${var.project_name}-IGW" }
}

# Subnets Privadas em Multi-AZ (Slide 3)
resource "aws_subnet" "private" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.irongrid_vpc.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  tags              = { Name = "${var.project_name}-private-${count.index}" }
}

# Direct Connect Gateway (Slide 4)
resource "aws_dx_gateway" "dx_gw" {
  name            = "irongrid-dx-gw"
  amazon_side_asn = "64512"
}

# VPN Gateway para Backup/Failover (Slide 5)
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = aws_vpc.irongrid_vpc.id
  tags   = { Name = "${var.project_name}-vpn-backup" }
}