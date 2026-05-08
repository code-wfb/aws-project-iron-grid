variable "vpc_id" {
  description = "ID da VPC vindo do módulo de network"
  type        = string
}

variable "subnet_ids" {
  description = "Lista de IDs das subnets para o GWLB"
  type        = list(string)
}
variable "project_name" {
  type    = string
  default = "IronGrid"
}