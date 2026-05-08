# --------------------------------------------------------------------------
# BACKEND CONFIGURATION
# --------------------------------------------------------------------------
# Wallace, este bloco define onde o arquivo de 'state' será armazenado.
# Para produção em grandes players, descomente o bloco abaixo após criar
# o Bucket S3 e a Tabela DynamoDB na sua conta AWS.
# --------------------------------------------------------------------------

terraform {
  # Enquanto estiver em teste local, o Terraform usará o backend "local" por padrão.
  
  /* backend "s3" {
    bucket         = "irongrid-terraform-state"        # Nome único do Bucket S3
    key            = "prod/terraform.tfstate"          # Caminho do arquivo no S3
    region         = "us-east-1"                       # Região da infra
    encrypt        = true                              # Criptografia em repouso
    dynamodb_table = "irongrid-terraform-state-lock"   # Tabela para State Locking
  }
  */
}