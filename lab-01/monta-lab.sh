#!/bin/bash
set -euo pipefail

# Resolve the directory of this script
SCRIPT_DIR=$(dirname "$(realpath "$0")")
LAB_DIR="${SCRIPT_DIR}/lab"

cria_imagem() {
    podman build -t localhost/ubuntu:v1 -f "${LAB_DIR}/Containerfile.Ubuntu" "${LAB_DIR}"
    podman build -t localhost/rocky:v1 -f "${LAB_DIR}/Containerfile.Rocky" "${LAB_DIR}"
}

sobe_lab() {
    podman-compose -f "${LAB_DIR}/podman-compose.yml" up -d
    podman ps
}

limpa() {
    podman-compose -f "${LAB_DIR}/podman-compose.yml" down
    podman image ls
    echo "Faça podman rm nas imagens"
}

echo "Escolha uma opcao:"
echo "1 - Criar Imagem"
echo "2 - Subir Lab"
echo "3 - Limpeza geral"
read -p "Opcao: " OPCAO

case "$OPCAO" in
    1) cria_imagem ;;
    2) sobe_lab ;;
    3) limpa ;;
    *) echo "Opcao Invalida" ;;
esac
