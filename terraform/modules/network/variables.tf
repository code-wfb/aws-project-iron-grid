variable "vpc_cidr" {
  type = string
}

variable "availability_zones" {
  type = list(string)
}

variable "private_subnets" {
  type = list(string)
}

# Faltava esta declaração aqui:
variable "project_name" {
  type = string
}