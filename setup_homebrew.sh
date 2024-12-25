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

# Verificar si curl está instalado
if command -v curl &>/dev/null; then
    echo -e "${GREEN}✔️ curl ya está instalado.${NC}"
else
    echo -e "${RED}❌ curl no está instalado. Instalando...${NC}"
    sudo apt install -y curl
    if command -v curl &>/dev/null; then
        echo -e "${GREEN}✔️ curl ha sido instalado correctamente.${NC}"
    else
        echo -e "${RED}❌ No se pudo instalar curl.${NC}"
        exit 1
    fi
fi

# Verificar si git está instalado
if command -v git &>/dev/null; then
    echo -e "${GREEN}✔️ Git ya está instalado.${NC}"
else
    echo -e "${RED}❌ Git no está instalado. Instalando...${NC}"
    sudo apt install -y git
    if command -v git &>/dev/null; then
        echo -e "${GREEN}✔️ Git ha sido instalado correctamente.${NC}"
    else
        echo -e "${RED}❌ No se pudo instalar Git.${NC}"
        exit 1
    fi
fi

# Verificar si build-essential está instalado
if dpkg -l | grep -q build-essential; then
    echo -e "${GREEN}✔️ build-essential ya está instalado.${NC}"
else
    echo -e "${RED}❌ build-essential no está instalado. Instalando...${NC}"
    sudo apt install -y build-essential
    if dpkg -l | grep -q build-essential; then
        echo -e "${GREEN}✔️ build-essential ha sido instalado correctamente.${NC}"
    else
        echo -e "${RED}❌ No se pudo instalar build-essential.${NC}"
        exit 1
    fi
fi

# Instalar Homebrew
echo -e "${CYAN}🚀 Instalando Homebrew...${NC}"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Verificar si la instalación fue exitosa
if command -v brew &>/dev/null; then
    echo -e "${GREEN}✔️ Homebrew ha sido instalado correctamente.${NC}"
else
    echo -e "${RED}❌ No se pudo instalar Homebrew.${NC}"
    exit 1
fi

# Configurar el PATH para Homebrew
echo -e "${CYAN}⚙️ Configurando el PATH para Homebrew...${NC}"

# Detectar el shell (bash o zsh) y actualizar el archivo adecuado
SHELL_NAME=$(basename $SHELL)
if [ "$SHELL_NAME" = "bash" ]; then
    echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.bashrc
    source ~/.bashrc
elif [ "$SHELL_NAME" = "zsh" ]; then
    echo 'export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
else
    echo -e "${RED}❌ Shell no soportado. Por favor, agrega Homebrew manualmente al PATH.${NC}"
    exit 1
fi

# Verificar que Homebrew está funcionando
echo -e "${CYAN}🔍 Verificando Homebrew...${NC}"
brew --version

# Mensaje final para el usuario
echo -e "${GREEN}🎉 ¡Homebrew instalado y configurado correctamente!${NC}"

# Capturar el tiempo de finalización
end_time=$(date +%s)

# Calcular el tiempo total en segundos
total_time=$((end_time - start_time))

# Imprimir el tiempo total
echo -e "${GREEN}⏰ Tiempo total de ejecución: ${total_time} segundos.${NC}"
