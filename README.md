# Ansible Lab — Fundamentos

> Trilha prática de aprendizado de Ansible do zero. Módulo 1: instalação,
> inventário, comandos ad-hoc e primeiro playbook.

## O que você treina aqui
- Modelo agentless e comunicação via SSH
- Inventário em formato INI e grupos de hosts
- Comandos ad-hoc (ping, command, shell, apt, copy)
- Estrutura de playbook, tasks e módulos core
- Idempotência na prática

## Pré-requisitos
- Podman >= 4.x (ou Docker, se preferir — comandos equivalentes)
- Ansible instalado no host de controle (>= 2.14)
- Nada de privilégio de root: o lab roda em Podman rootless

## Quick start (Podman)
```bash
# 1. Build da imagem dos hosts gerenciados
cd lab
podman build -t ansible-lab .

# 2. Sobe os dois nós do lab
podman run -d --name node1 -p 2221:22 ansible-lab
podman run -d --name node2 -p 2222:22 ansible-lab

# 3. (Opcional) Testa o SSH manualmente — senha: ansible
ssh -p 2221 ansible@127.0.0.1

# 4. Testa a conectividade com o Ansible
ansible lab -m ping

# 5. Roda os playbooks do módulo
ansible-playbook playbooks/01-ping.yml
ansible-playbook playbooks/02-primeiro-playbook.yml
