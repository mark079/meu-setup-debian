#!/bin/bash

# Interrompe o script se houver qualquer erro
set -e

# Cores para o feedback visual
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sem cor

clear
echo -e "${BLUE}=========================================================${NC}"
echo -e "${BLUE}   SETUP DEBIAN 13 - DELL INSPIRON 3501 (11th Gen)       ${NC}"
echo -e "${BLUE}=========================================================${NC}"

# 1. Configuração de Repositórios
echo -e "\n${YELLOW}[1/5] Configurando repositórios (non-free)...${NC}"
sudo sed -i 's/main/main contrib non-free non-free-firmware/g' /etc/apt/sources.list
sudo apt update && sudo apt upgrade -y
echo -e "${GREEN}✔ Repositórios atualizados!${NC}"

# 2. Instalação do Ambiente GNOME
echo -e "\n${YELLOW}[2/5] Instalando GNOME Mínimo...${NC}"
sudo apt install -y \
    gnome-session gdm3 gnome-terminal nautilus \
    gnome-control-center network-manager-gnome \
    xdg-user-dirs-gtk gnome-tweaks power-profiles-daemon
echo -e "${GREEN}✔ Ambiente gráfico instalado!${NC}"

# 3. Drivers e Firmware Intel Iris Xe
echo -e "\n${YELLOW}[3/5] Instalando Drivers e Firmwares Intel...${NC}"
sudo apt install -y \
    intel-media-va-driver-non-free \
    firmware-misc-nonfree \
    firmware-intel-sound \
    va-driver-all vdpau-va-driver mesa-utils
echo -e "${GREEN}✔ Drivers de vídeo e som configurados!${NC}"

# 4. Configuração de Performance (zRAM)
echo -e "\n${YELLOW}[4/5] Configurando zRAM (4GB comprimido)...${NC}"
sudo apt install -y systemd-zram-generator
sudo bash -c 'cat <<EOF > /etc/systemd/zram-generator.conf
[zram0]
zram-size = 4096
compression-algorithm = zstd
swap-priority = 100
fs-type = swap
EOF'
sudo systemctl daemon-reload
echo -e "${GREEN}✔ Memória zRAM configurada com sucesso!${NC}"

# 5. Finalização
echo -e "\n${YELLOW}[5/5] Aplicando toques finais...${NC}"
# Organiza as pastas de usuário (Documentos, Downloads, etc)
xdg-user-dirs-gtk-update 2>/dev/null || true

echo -e "${BLUE}=========================================================${NC}"
echo -e "${GREEN}          INSTALAÇÃO CONCLUÍDA COM SUCESSO!            ${NC}"
echo -e "${BLUE}=========================================================${NC}"
echo -e "Hardware: Dell Inspiron 3501 (Tiger Lake)"
echo -e "Interface: GNOME Minimal"
echo -e "Otimização: zRAM Ativo (4GB)"
echo -e "${YELLOW}RECOMENDAÇÃO: Reinicie o sistema agora com 'sudo reboot'${NC}"
echo -e "${BLUE}=========================================================${NC}"
