# 🛡️ IronGrid AI - Autonomous AIOps Dashboard

**IronGrid AI** is an intelligent observability and automated remediation platform designed to reduce MTTR (Mean Time To Repair) in mission-critical cloud environments.

## 🚀 The Challenge
Manual troubleshooting of BGP failures and infrastructure drifts can take hours. IronGrid bridges the gap between detection and resolution by integrating Generative AI directly into the DevOps workflow.

## 🧠 How it Works
1. **Detection:** Monitors infrastructure for drifts or connectivity failures.
2. **Analysis:** Sends logs to **Amazon Bedrock (Claude 3.5 Sonnet)** to identify root causes.
3. **Remediation:** Generates and executes **Terraform** payloads automatically.
4. **Governance:** Opens, updates, and resolves tickets via **Jira API** for full auditability.

## 🛠️ Tech Stack
- **AI:** Amazon Bedrock (Claude 3.5 Sonnet)
- **Infrastructure:** Terraform & AWS
- **Dashboard:** Streamlit & Python
- **Governance:** Jira Service Management API

- ## 🔒 Enterprise-Grade Security Architecture (Production Roadmap)
To satisfy stringent financial-grade compliance (PCI-DSS / ISO 27001) and prevent asymmetric routing drops, the underlying network infrastructure is designed around a **Hub-and-Spoke topology**:
- **Inspection VPC:** Centralizes all inbound/outbound traffic through a Stateful Firewall cluster.
- **AWS Gateway Load Balancer (GWLB):** Utilizes **GENEVE protocol encapsulation (UDP port 6081)** to ensure transparent packet inspection without headers modification.
- **AWS Transit Gateway (TGW):** Orchestrates routing across VPC Spokes with **Appliance Mode enabled**, forcing return traffic through the same firewall endpoint to prevent session drops.

## 📈 Business Impact & ROI
- **99% MTTR Reduction:** Shifts MTTR from hours of manual troubleshooting to seconds of automated remediation.
- **Zero Configuration Drift:** Continuous reconciliation loops using Terraform prevents shadow IT and unauthorized environment modifications.
- **Auditable Governance:** 100% of autonomous actions are tied to signed Git commits and Jira Service Management tickets.

## 📺 Demo
[![Assista o Vídeo](https://img.shields.io/badge/PLAY-Video_Demo-blue?style=for-the-badge&logo=youtube)](https://github.com/code-wfb/aws-project-iron-grid/raw/main/Video-Dashboard-Iron-Grid-AI.mp4)



---
*Developed by Wallace - Cloud & SRE Engineering*
