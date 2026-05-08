variable "subnet_ids" {
  description = "Lista de IDs das subnets vindas do módulo network"
  type        = list(string)
}

variable "security_group_id" {
  description = "ID do Security Group vindo do módulo security"
  type        = string
}

variable "project_name" {
  type    = string
  default = "IronGrid"
}