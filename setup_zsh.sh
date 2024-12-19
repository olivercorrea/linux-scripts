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
    sudo apt update && sudo apt install -y curl
    if command -v curl &>/dev/null; then
        echo -e "${GREEN}✔️ curl ha sido instalado correctamente.${NC}"
    else
        echo -e "${RED}❌ No se pudo instalar curl.${NC}"
    fi
fi

# Verificar si git está instalado
if command -v git &>/dev/null; then
    echo -e "${GREEN}✔️ Git ya está instalado.${NC}"
else
    echo -e "${RED}❌ Git no está instalado. Instalando...${NC}"
    sudo apt update && sudo apt install -y git
    if command -v git &>/dev/null; then
        echo -e "${GREEN}✔️ Git ha sido instalado correctamente.${NC}"
    else
        echo -e "${RED}❌ No se pudo instalar Git.${NC}"
    fi
fi

# Instalar zsh
echo -e "${CYAN}💻 Instalando Zsh...${NC}"
sudo apt install zsh -y

# Verificar la versión de Zsh
echo -e "${CYAN}🔍 Verificando la versión de Zsh...${NC}"
zsh --version

# Instalar Oh My Zsh
echo -e "${CYAN}🚀 Instalando Oh My Zsh...${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Definir la variable ZSH_CUSTOM (si no está ya definida)
ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Clonar los plugins de Zsh (ahora usando el directorio correcto)
echo -e "${CYAN}🔌 Instalando plugins de Zsh...${NC}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Configurar el archivo .zshrc
echo -e "${CYAN}⚙️ Configurando .zshrc...${NC}"

# Verifica si el archivo .zshrc existe
if [ -f ~/.zshrc ]; then
    echo -e "${GREEN}✅ Configuración de .zshrc existente...${NC}"
else
    echo -e "${YELLOW}⚠️ No se encontró .zshrc, creando uno nuevo...${NC}"
    cp $ZSH/custom/templates/zshrc.zsh-template ~/.zshrc
fi

# Escribir configuraciones en .zshrc si no existen
# Comprobar si ya existe una configuración para el tema ZSH y actualizarla
if grep -q 'ZSH_THEME' ~/.zshrc; then
    # Si existe, reemplazamos la línea de ZSH_THEME
    sed -i 's|^ZSH_THEME=.*|ZSH_THEME="robbyrussell"|' ~/.zshrc
else
    # Si no existe, agregar al final
    echo 'ZSH_THEME="robbyrussell"' >>~/.zshrc
fi

# Comprobar si ya existe una configuración para los plugins y actualizarla
if grep -q 'plugins=' ~/.zshrc; then
    # Si existe, reemplazamos la línea de plugins
    sed -i 's|^plugins=.*|plugins=(git zsh-autosuggestions zsh-syntax-highlighting command-not-found docker docker-compose dotnet node npm ssh sudo systemd tldr ubuntu vscode zsh-interactive-cd aws)|' ~/.zshrc
else
    # Si no existe, agregar al final
    echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting command-not-found docker docker-compose dotnet node npm ssh sudo systemd tldr ubuntu vscode zsh-interactive-cd aws eza)' >>~/.zshrc
fi

# Cambiar la shell predeterminada a Zsh (sin intervención)
echo -e "${CYAN}🔄 Cambiando la shell predeterminada a Zsh...${NC}"
sudo chsh -s $(which zsh) $USER

# Mensaje final para el usuario
echo -e "${GREEN}🎉 ¡Cambio realizado con éxito! Cierra y vuelve a abrir la sesión o ejecuta 'zsh' para aplicarlo.${NC}"

# Capturar el tiempo de finalización
end_time=$(date +%s)

# Calcular el tiempo total en segundos
total_time=$((end_time - start_time))

# Imprimir el tiempo total
echo -e "${GREEN}⏰ Tiempo total de ejecución: ${total_time} segundos.${NC}"
