# 🐧 Debian Setup - Dell Inspiron 3501

Este repositório contém um script de automação para configurar uma instalação limpa do **Debian 13 (Trixie)** em um laptop **Dell Inspiron 3501** (i5 11th Gen, 16GB RAM).

O foco deste setup é transformar uma instalação mínima (netinstall) em uma estação de trabalho de alto desempenho para desenvolvimento web (**Nuxt.js, Laravel Sail, Docker**).

## 🚀 O que este script faz?

1.  **Repositórios:** Habilita as seções `contrib`, `non-free` e `non-free-firmware`.
2.  **Ambiente Gráfico:** Instala o **GNOME Minimal** (sem bloatwares).
3.  **Drivers Intel:** Configura aceleração de hardware para a GPU **Iris Xe** e firmwares para processadores Tiger Lake.
4.  **Otimização de Memória:** Configura **zRAM (4GB)** com algoritmo `zstd` para maximizar os 16GB de RAM e proteger o SSD NVMe.
5.  **Energia:** Instala o `power-profiles-daemon` para integração nativa com o gerenciamento de energia do GNOME.

## 💻 Hardware Alvo
- **Modelo:** Dell Inspiron 3501
- **CPU:** Intel Core i5-1135G7
- **GPU:** Intel Iris Xe Graphics
- **RAM:** 16GB DDR4
- **SSD:** 256GB NVMe

## 🛠️ Como usar

Após realizar a instalação mínima do Debian (apenas sistema base, sem ambiente gráfico), certifique-se de que seu usuário tem permissões de `sudo` e que a internet está ativa.

Rode o comando abaixo:

```bash
curl -sSL [https://raw.githubusercontent.com/mark079/meu-setup-debian/main/install.sh](https://raw.githubusercontent.com/mark079/meu-setup-debian/main/install.sh) | bash
