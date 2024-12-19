#!/bin/bash

# Definición de colores
GREEN='\033[0;32m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # Sin color

echo -e "${CYAN}🔍 Detectando el sistema operativo...${NC}"

# Intentar obtener la información de la distribución
if [ -f /etc/os-release ]; then
    # Usar /etc/os-release para obtener el nombre y la versión
    . /etc/os-release
    echo -e "${GREEN}✔️ Estás usando: ${NC}$NAME $VERSION"
elif [ -f /etc/lsb-release ]; then
    # Si no existe /etc/os-release, intentar con /etc/lsb-release (en distribuciones basadas en Ubuntu/Debian)
    . /etc/lsb-release
    echo -e "${GREEN}✔️ Estás usando: ${NC}$DISTRIB_ID $DISTRIB_RELEASE $DISTRIB_CODENAME"
elif [ -f /etc/debian_version ]; then
    # Si no existe /etc/os-release ni /etc/lsb-release, verificar en Debian y derivados
    echo -e "${GREEN}✔️ Estás usando: ${NC}Debian $(cat /etc/debian_version)"
elif [ -f /etc/redhat-release ]; then
    # Si no existe ninguno de los anteriores, intentar con distribuciones basadas en RedHat
    echo -e "${GREEN}✔️ Estás usando: ${NC}$(cat /etc/redhat-release)"
else
    echo -e "${RED}❌ No se pudo detectar el sistema operativo.${NC}"
fi
