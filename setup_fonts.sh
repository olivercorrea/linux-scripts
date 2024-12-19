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

# Verificar si curl está instalado
if command -v curl &>/dev/null; then
    echo -e "${GREEN}✔️ curl ya está instalado.${NC}"
else
    echo -e "${RED}❌ curl no está instalado. Instalando...${NC}"
    sudo apt update && sudo apt install -y curl
    if command -v curl &>/dev/null; then
        echo -e "${GREEN}✔️ curl ha sido instalado correctamente.${NC}"
    else
        echo -e "${RED}❌ No se pudo instalar curl.${NC}"
    fi
fi

# Definir la carpeta de destino para las fuentes
FONT_DIR="$HOME/.local/share/fonts"

# Asegúrate de que la carpeta de fuentes exista
mkdir -p "$FONT_DIR"

# Mensaje de bienvenida
echo -e "${CYAN}🚀 Iniciando la instalación de las fuentes JetBrains Mono...${NC}"

# Descargar la última versión de JetBrainsMono desde GitHub
cd ~/Downloads/

# Crear una carpeta para almacenar el archivo descargado
mkdir -p JetBrainsMono

# Descargar el archivo .tar.xz de JetBrainsMono
echo -e "${YELLOW}📥 Descargando JetBrainsMono...${NC}"
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz

# Extraer el archivo .tar.xz
echo -e "${YELLOW}📦 Extrayendo JetBrainsMono...${NC}"
tar -xvf JetBrainsMono.tar.xz -C JetBrainsMono

# Mover las fuentes a la carpeta de fuentes local
echo -e "${GREEN}✅ Moviendo las fuentes a $FONT_DIR...${NC}"
mv ~/Downloads/JetBrainsMono/* "$FONT_DIR/"

# Actualizar la caché de fuentes
echo -e "${CYAN}🔄 Actualizando caché de fuentes...${NC}"
fc-cache -fv

# Mensaje final
echo -e "${GREEN}🎉 JetBrains Mono se ha instalado correctamente. Ahora puedes cambiar el tema de tu terminal a JetBrains Mono. ¡Disfruta!${NC}"

# Capturar el tiempo de finalización
end_time=$(date +%s)

# Calcular el tiempo total en segundos
total_time=$((end_time - start_time))

# Imprimir el tiempo total
echo -e "${GREEN}⏰ Tiempo total en instalar y configurar las fuentes: ${total_time} segundos.${NC}"
