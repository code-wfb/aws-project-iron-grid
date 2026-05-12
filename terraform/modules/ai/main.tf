# IAM Role para a Lambda de IA
resource "aws_iam_role" "ai_lambda_role" {
  name = "irongrid-ai-diagnostics-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

# Permissão para Invocar o Bedrock (Claude 3.5)
resource "aws_iam_policy" "bedrock_access" {
  name        = "IronGridBedrockAccess"
  description = "Permite que a Lambda use o Amazon Bedrock"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action   = "bedrock:InvokeModel"
      Effect   = "Allow"
      Resource = "arn:aws:bedrock:us-east-1::foundation-model/anthropic.claude-3-5-sonnet-20240620-v1:0"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "attach_bedrock" {
  role       = aws_iam_role.ai_lambda_role.name
  policy_arn = aws_iam_policy.bedrock_access.arn
}

# Definição da Lambda
resource "aws_lambda_function" "ai_diagnostics" {
  filename      = "ai_lambda.zip" # O Terraform vai zipar o código
  function_name = "irongrid-ai-diagnostics"
  role          = aws_iam_role.ai_lambda_role.arn
  handler       = "diagnostics.lambda_handler"
  runtime       = "python3.11"
  timeout       = 30
}