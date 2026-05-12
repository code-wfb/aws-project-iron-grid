import boto3
import json
import os

def lambda_handler(event, context):
    # Inicializa o cliente do Bedrock
    bedrock = boto3.client(service_name='bedrock-runtime', region_name='us-east-1')
    
    # Extrai a mensagem de log do evento (CloudWatch Logs)
    log_data = event.get('log_message', 'Nenhum log fornecido.')
    
    prompt = f"""
    Você é o Engenheiro de IA do Projeto IronGrid.
    Analise o seguinte incidente de rede e forneça:
    1. Causa Raiz Provável.
    2. Ação de Remediação Imediata.
    3. Comando CLI ou Terraform para correção.

    Log do Incidente: {log_data}
    """

    body = json.dumps({
        "anthropic_version": "bedrock-2023-05-31",
        "max_tokens": 1000,
        "messages": [
            {
                "role": "user",
                "content": prompt
            }
        ]
    })

    try:
        response = bedrock.invoke_model(
            modelId='anthropic.claude-3-5-sonnet-20240620-v1:0',
            body=body
        )
        response_body = json.loads(response.get('body').read())
        analysis = response_body['content'][0]['text']
        
        print(f"Análise IronGrid AI: {analysis}")
        return {"status": "success", "analysis": analysis}
    
    except Exception as e:
        print(f"Erro ao consultar Bedrock: {str(e)}")
        return {"status": "error", "message": str(e)}