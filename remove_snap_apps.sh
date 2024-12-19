#!/bin/bash

# Definición de colores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # Sin color

# Función principal para eliminar aplicaciones
remove_application() {
    # Obtener la lista de aplicaciones instaladas con Snap, excluyendo el encabezado
    installed_apps=$(snap list | tail -n +2)  # Usamos 'tail -n +2' para omitir el encabezado

    # Si no hay aplicaciones instaladas con Snap
    if [[ -z "$installed_apps" ]]; then
        echo -e "${RED}❌ No hay aplicaciones instaladas con Snap.${NC}"
        return
    fi

    # Mostrar las aplicaciones instaladas con Snap
    echo -e "${GREEN}✔️ Aplicaciones instaladas con Snap:${NC}"
    echo "$installed_apps" | awk '{print NR ": " $1}'  # Muestra las aplicaciones con su índice

    # Añadir opción de salir
    echo -e "${CYAN}0: Salir${NC}"

    # Solicitar al usuario el número de la aplicación que desea eliminar
    echo -e "${CYAN}Selecciona el número de la aplicación que deseas eliminar (o 0 para salir):${NC}"
    read -p "Número de la aplicación: " app_number

    # Si el número es 0, salir
    if [[ "$app_number" -eq 0 ]]; then
        echo -e "${GREEN}✔️ Saliendo del script. ¡Hasta luego!${NC}"
        exit 0
    fi

    # Validar si la entrada es un número válido
    if ! [[ "$app_number" =~ ^[0-9]+$ ]]; then
        echo -e "${RED}❌ Por favor, ingresa un número válido.${NC}"
        return
    fi

    # Obtener el nombre de la aplicación seleccionada
    app_name=$(echo "$installed_apps" | awk "NR==$app_number {print \$1}")

    # Verificar si el nombre de la aplicación es válido
    if [[ -z "$app_name" ]]; then
        echo -e "${RED}❌ Selección inválida. No se encontró la aplicación.${NC}"
        return
    fi

    # Confirmar la desinstalación
    echo -e "${YELLOW}⚠️ Estás a punto de eliminar '$app_name'. ¿Estás seguro? (y/n)${NC}"
    read -p "Confirmación: " confirmation

    # Si el usuario confirma, proceder con la eliminación
    if [[ "$confirmation" == "y" || "$confirmation" == "Y" ]]; then
        echo -e "${CYAN}🗑️ Eliminando la aplicación '$app_name'...${NC}"
        sudo snap remove "$app_name"
        echo -e "${GREEN}✔️ La aplicación '$app_name' ha sido eliminada con éxito.${NC}"
    else
        echo -e "${GREEN}✔️ Operación cancelada. No se ha eliminado ninguna aplicación.${NC}"
    fi
}

# Bucle principal
while true; do
    # Llamar a la función para eliminar aplicaciones
    remove_application

    # Preguntar si desea eliminar otra aplicación
    echo -e "${CYAN}¿Quieres eliminar otra aplicación? (y/n)${NC}"
    read -p "Confirmación: " continue_choice

    # Salir del bucle si la respuesta es 'n' o 'N'
    if [[ "$continue_choice" != "y" && "$continue_choice" != "Y" ]]; then
        echo -e "${GREEN}✔️ Saliendo del script. ¡Hasta luego!${NC}"
        break
    fi
done
