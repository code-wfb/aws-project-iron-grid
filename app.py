import streamlit as st
import pandas as pd
import time
import json
from datetime import datetime

# Configurações da Página
st.set_page_config(page_title="IronGrid AIOps Dashboard", layout="wide")

# Estilo customizado para parecer um Terminal
st.markdown("""
    <style>
    .main { background-color: #0e1117; }
    .stMetric { background-color: #161b22; border-radius: 10px; padding: 15px; }
    </style>
    """, unsafe_allow_html=True)

st.title("🛡️ IronGrid | AIOps & Infrastructure Governance")
st.info("Modo de Demonstração: Full Stack AIOps Workflow (Simulated)")

# --- ESTADO DA SESSÃO ---
if 'erro_ativo' not in st.session_state:
    st.session_state.erro_ativo = False
if 'ticket_criado' not in st.session_state:
    st.session_state.ticket_criado = False

# --- BARRA LATERAL ---
st.sidebar.header("🕹️ Centro de Injeção de Falhas")
if st.sidebar.button("🚨 Simular Queda BGP (MRS Logistics)"):
    st.session_state.erro_ativo = True
    st.session_state.ticket_criado = False
    st.session_state.log_time = datetime.now().strftime("%H:%M:%S")

if st.sidebar.button("🧹 Resetar Ambiente"):
    st.session_state.erro_ativo = False
    st.session_state.ticket_criado = False
    st.rerun()

# --- LAYOUT PRINCIPAL ---
tab1, tab2, tab3 = st.tabs(["📊 Dashboard Operacional", "🧠 Cérebro da IA (JSON)", "📋 Governança (Jira)"])

with tab1:
    col1, col2 = st.columns([1, 1])
    with col1:
        st.subheader("📡 Logs de Rede em Tempo Real")
        if st.session_state.erro_ativo:
            df_logs = pd.DataFrame([
                {"Timestamp": st.session_state.log_time, "Event": "BGP State Change: Idle", "Severity": "CRITICAL"},
                {"Timestamp": st.session_state.log_time, "Event": "TGW Route Table Update: Path Lost", "Severity": "ERROR"}
            ])
            st.table(df_logs)
        else:
            st.success("✅ Todos os túneis VPN e BGP Established.")

    with col2:
        st.subheader("🤖 Diagnóstico Amazon Bedrock")
        if st.session_state.erro_ativo:
            st.error("**Causa Raiz:** Drift detectado no roteador On-Premises.")
            if st.button("🛠️ Executar Auto-Remediação"):
                with st.spinner("Sincronizando Terraform State..."):
                    time.sleep(2)
                st.success("Infraestrutura restaurada!")
        else:
            st.write("Monitorando métricas de latência e jitter...")

with tab2:
    st.subheader("📦 Payload de Análise GenAI")
    st.write("Este é o JSON estruturado que a IA envia para o orquestrador (Lambda):")
    
    payload_simulado = {
        "project": "IronGrid",
        "model": "anthropic.claude-3-5-sonnet",
        "analysis": {
            "incident_type": "BGP_SESSION_FAILURE",
            "detected_at": st.session_state.get('log_time', 'N/A'),
            "root_cause": "Configuration drift on MRS-LOG-R01",
            "remediation_code": "terraform apply -target=module.hybrid_network.aws_vpn_connection.main",
            "confidence_score": 0.98
        }
    }
    st.json(payload_simulado)

with tab3:
    st.subheader("📑 Gestão de Incidentes (ITSM)")
    if st.session_state.erro_ativo:
        if not st.session_state.ticket_criado:
            if st.button("🎟️ Abrir Ticket no Jira"):
                with st.spinner("Conectando à API do Jira..."):
                    time.sleep(1.5)
                st.session_state.ticket_criado = True
        
        if st.session_state.ticket_criado:
            st.warning("⚠️ Ticket **IG-2026-089** aberto via AIOps.")
            st.write("**Resumo:** Falha Crítica BGP detectada e analisada automaticamente.")
            st.write("**Status:** Em aguardo de aprovação manual para fechamento.")
    else:
        st.write("Nenhum ticket aberto no momento.")

# --- MÉTRICAS DE RODAPÉ ---
st.divider()
m1, m2, m3 = st.columns(3)
m1.metric("Uptime Global", "100%" if not st.session_state.erro_ativo else "99.99%", "Stable")

# Aqui ele vai mostrar 1 se houver erro, e 0 se estiver tudo OK
incidentes = 1 if st.session_state.erro_ativo else 0
m2.metric("Incidentes Ativos", incidentes, "-1" if not st.session_state.erro_ativo and incidentes == 0 else "+1")

m3.metric("MTTR Médio (IA)", "0 min" if not st.session_state.erro_ativo else "1.2 min", "Optimization Active")