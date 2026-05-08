variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "availability_zones" {
  description = "AZs para deploy"
  type        = list(string)
}

variable "private_subnets" {
  description = "Lista de CIDRs das subnets privadas"
  type        = list(string)
}

variable "environment" {
  description = "Nome do ambiente"
  type        = string
}

variable "project_name" {
  description = "Nome do projeto"
  type        = string
}