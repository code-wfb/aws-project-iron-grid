provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "../../modules/network"

  # Você precisa passar as variáveis da Raiz para o Módulo aqui:
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  private_subnets    = var.private_subnets
  project_name       = var.project_name
}

module "security" {
  source     = "../../modules/security"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.private_subnet_ids
}

module "compute" {
  source            = "../../modules/compute"
  project_name      = var.project_name
  subnet_ids        = module.network.private_subnet_ids
  security_group_id = module.security.security_group_id
}