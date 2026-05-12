# AWS IronGrid: Intelligent Cloud Resilience & AIOps 🚀

[![Terraform](https://img.shields.io/badge/Terraform-1.0+-623CE4.svg?style=flat&logo=terraform)](https://www.terraform.io/)
[![AWS](https://img.shields.io/badge/AWS-Cloud-orange.svg?style=flat&logo=amazon-aws)](https://aws.amazon.com/)
[![GenAI](https://img.shields.io/badge/AI-Amazon_Bedrock-blue.svg?style=flat&logo=openai)](https://aws.amazon.com/bedrock/)

**IronGrid** is a high-availability hybrid networking architecture designed for mission-critical operations. Originally inspired by the rigorous demands of the broadcast industry, it has evolved into an **AIOps-driven platform** that leverages Generative AI to ensure 99.9% uptime.

## 🌟 Key Features

- **Hybrid Resilience:** Automated failover between AWS Direct Connect and Site-to-Site VPN using BGP.
- **AIOps Diagnostics:** Real-time Root Cause Analysis (RCA) powered by **Amazon Bedrock (Claude 3.5 Sonnet)**.
- **Traffic Inspection:** Deep Packet Inspection (DPI) via **Gateway Load Balancer (GWLB)** and GENEVE protocol.
- **Infrastructure as Code:** 100% automated deployment using modular Terraform.

## 🧠 The AIOps Layer (New!)

The "Intelligence Layer" moves beyond simple monitoring. When a network anomaly is detected:
1. **CloudWatch** captures the event (BGP flap, latency spike, or failover).
2. An **AWS Lambda** function is triggered, sending the raw logs to **Amazon Bedrock**.
3. **Claude 3.5 Sonnet** analyzes the logs and provides a human-readable diagnostic, suggesting immediate remediation steps and CLI commands to fix the issue.

> **Result:** Drastic reduction in **MTTR** (Mean Time To Repair) and operational overhead.

## 🏗️ Architecture



- **VPC / Networking:** Transit Gateway, Private Subnets, and Multi-AZ deployment.
- **Security:** Security Groups, NACLs, and GWLB for centralized traffic inspection.
- **Compute:** Auto Scaling Groups for resilient application delivery.
- **AI/ML:** Amazon Bedrock (Anthropic Claude 3.5) & AWS Lambda.

## 🛠️ Project Structure

```text
.
├── terraform/
│   ├── environments/       # Dev/Prod configurations
│   ├── modules/
│   │   ├── network/        # VPC, Transit Gateway, BGP
│   │   ├── compute/        # EC2, Auto Scaling
│   │   ├── security/       # IAM, GWLB, Security Groups
│   │   └── ai/             # Bedrock, Lambda, AIOps Logic
└── scripts/                # Helper scripts for automation

🚀 How to Deploy

    Initialize Terraform:
    Bash

    terraform init

    Review the plan:
    Bash

    terraform plan

    Apply the infrastructure:
    Bash

    terraform apply

👨‍💻 Author

Wallace – Cloud Infrastructure Engineer
Specialist in Resilience, Mission-Critical Systems, and Cloud Architecture.

This project is part of my technical portfolio to demonstrate advanced AWS networking and AIOps capabilities.