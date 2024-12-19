#!/bin/bash

# Definición de colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color

# Capturar el tiempo de inicio
start_time=$(date +%s)

# Actualiza los paquetes y asegura que todo esté actualizado
echo -e "${CYAN}🔄 Actualizando paquetes...${NC}"
sudo apt update && sudo apt upgrade -y

# Instalar dependencias necesarias para compilar eza
echo -e "${CYAN}🔧 Instalando build-essential...${NC}"
sudo apt install build-essential -y

# Instalar cargo (si no está instalado)
if ! command -v cargo &>/dev/null; then
    echo -e "${RED}❌ Cargo no está instalado. Instalando...${NC}"
    #sudo apt install -y cargo
    if command -v cargo &>/dev/null; then
        echo -e "${GREEN}✔️ Cargo ha sido instalado correctamente.${NC}"
    else
        echo -e "${RED}❌ No se pudo instalar Cargo.${NC}"
    fi
else
    echo -e "${GREEN}✔️ Cargo ya está instalado.${NC}"
fi

# Instalar eza usando cargo
echo -e "${CYAN}🚀 Instalando eza...${NC}"
cargo install eza

# Verificar si eza se instaló correctamente
if command -v eza &>/dev/null; then
    echo -e "${GREEN}✔️ eza ha sido instalado correctamente.${NC}"
else
    echo -e "${RED}❌ No se pudo instalar eza.${NC}"
    exit 1
fi

# Configurar el archivo .zshrc
echo -e "${CYAN}⚙️ Configurando .zshrc...${NC}"

# Verifica si el archivo .zshrc existe
if [ -f ~/.zshrc ]; then
    echo -e "${GREEN}✅ Configuración de .zshrc existente...${NC}"
else
    echo -e "${YELLOW}⚠️ No se encontró .zshrc, creando uno nuevo...${NC}"
    cp $ZSH/custom/templates/zshrc.zsh-template ~/.zshrc
fi

# Añadir alias de eza al final de .zshrc si no existen
if ! grep -q "alias ls='eza --icons'" ~/.zshrc; then
    echo -e "${CYAN}✍️ Añadiendo alias para eza en .zshrc...${NC}"
    echo "alias ls='eza --icons'" >> ~/.zshrc
    echo "alias ll='eza -lah --icons'" >> ~/.zshrc
else
    echo -e "${GREEN}✔️ Alias para eza ya está configurado en .zshrc.${NC}"
fi

# Mensaje final para el usuario
echo -e "${GREEN}🎉 ¡eza instalado y configurado con éxito! Cierra y vuelve a abrir la sesión o ejecuta 'zsh' para aplicar los cambios.${NC}"

# Capturar el tiempo de finalización
end_time=$(date +%s)

# Calcular el tiempo total en segundos
total_time=$((end_time - start_time))

# Imprimir el tiempo total
echo -e "${GREEN}⏰ Tiempo total de ejecución: ${total_time} segundos.${NC}"
