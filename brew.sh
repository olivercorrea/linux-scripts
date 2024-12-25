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
echo -e "${CYAN}Actualizando paquetes...${NC}"
sudo apt update && sudo apt upgrade -y

# Verifica si `brew` está instalado
if command -v brew &>/dev/null; then
    echo -e "${GREEN}✔️ Homebrew esta instalado.${NC}"
else
    echo -e "${RED}❌ Homebrew no esta instalado, instalando...${NC}"
    # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" </dev/null
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

echo -e "${CYAN}🚀 Installando aplicaciones brew ..${NC}"

# Ya instalado
# brew install gcc

## Find files easily
brew install fzf
#brew install sk

## Better terminal history. Ctrl + r .
brew install atuin

## Better system monitor
brew install btop
#brew install bottom

## Searching tool, alternative to grep. cargo install ripgrep
brew install ripgrep

## Better cat
brew install bat

## Quick CLI help or better man
brew install tldr

## Code formatter, Rustup: the Rust toolchain installer
# brew install rustup
# rustup component add rustfmt

## Tiling WM for your terminal. I do not really needed, so do not install it.
#brew install zellij

## CPU architecture fetching tool. Like neofetch.
#brew install cpufetch

## Command-line interface for https://speedtest.net bandwidth tests
brew install speedtest-cli

## Terminal-based visual file manager. mc
#brew install midnight-commander

## ranger is a console file manager with VI key bindings.
#brew install ranger

## Aquarium animation in ASCII art
#brew install asciiquarium

## Programmatically correct mistyped console commands. fuck ⭐
brew install thefuck

## Provides fake name and address data ⭐
brew install rig

## Console Matrix
brew install cmatrix

## has checks presence of various command line tools on the PATH and reports their installed version.
brew install kdabir/tap/has

## A tool to view and manipulate Git repositories in a terminal.
#brew install tig

## Ambitious Vim-fork focused on extensibility and agility
#brew install neovim

## A modern and user-friendly terminal-based SSH client.
#brew install mosh

## Starship for a better looking promt terminal
brew install starship

echo -e "${GREEN}🎉 Aplicaciones brew instalados ...${NC}"

# Mensaje final para el usuario
echo -e "${GREEN}🎉 ¡Aplicaciones Homebrew han sido isntalados correctamente!${NC}"

# Capturar el tiempo de finalización
end_time=$(date +%s)

# Calcular el tiempo total en segundos
total_time=$((end_time - start_time))

# Imprimir el tiempo total
echo -e "${GREEN}⏰ Tiempo total de ejecución: ${total_time} segundos.${NC}"
