resource "aws_instance" "app_server" {
  count         = 2
  ami           = "ami-0c101f26f147fa7fd" # Amazon Linux 2023 em us-east-1
  instance_type = "t3.medium"
  
  # Aqui usamos as variáveis que declaramos acima
  subnet_id              = var.subnet_ids[count.index]
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.project_name}-App-${count.index}"
  }
}