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

# Mensaje de inicio
echo -e "${CYAN}🚀 Iniciando la instalación de Rust...${NC}"

# Descargar e instalar Rust usando rustup
echo -e "${YELLOW}📥 Descargando e instalando Rust...${NC}"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain stable -y

# Cargar el entorno de Rust
echo -e "${GREEN}✅ Instalación completada. Cargando el entorno de Rust...${NC}"
. "$HOME/.cargo/env"

# Verificar las versiones de rustc y cargo
echo -e "${CYAN}🔍 Verificando la versión de Rust...${NC}"
rustc --version

echo -e "${CYAN}🔍 Verificando la versión de Cargo...${NC}"
cargo --version

# Mensaje final
echo -e "${GREEN}🎉 Rust ha sido instalado correctamente. ¡Listo para usar!${NC}"

# Capturar el tiempo de finalización
end_time=$(date +%s)

# Calcular el tiempo total en segundos
total_time=$((end_time - start_time))

# Imprimir el tiempo total
echo -e "${GREEN}⏰ Tiempo total en instalar Rust: ${total_time} segundos.${NC}"
