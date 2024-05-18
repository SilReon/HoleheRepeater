#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

trap ctrl_c INT

function ctrl_c(){
	service tor stop
	sleep 0.5
	echo -e "\n${yellowColour}[*]${endColour}${grayColour} Exit ...${endColour}"
	tput cnorm;
	exit 1
}

# Verificar que se haya proporcionado un archivo como argumento
if [ $# -eq 0 ]; then
    echo "Uso: $0 <archivo>"
    exit 1
fi

archivo=$1

# Verificar que el archivo exista
if [ ! -f "$archivo" ]; then
    echo "El archivo $archivo no existe."
    exit 1
fi

service tor start
		
sleep 3
 
ip1="$(sudo proxychains curl https://ipecho.net/plain 2>/dev/null)"
ip2=""
index=1

# Leer el archivo línea por línea e imprimir cada línea
while IFS= read -r linea; do
    if [ $((index % 5)) -eq 0 ]; then
      echo -e "[!] Reseteando el servicio TOR...\n\n"
      service tor restart
	    sleep 2
      ip2=$ip1
      ip1="$(sudo proxychains curl https://ipecho.net/plain 2>/dev/null)"
      
	    sleep 1
	    while [ "$ip2" == "$ip1" ] || [ "$ip2" == "" ] ; do
		    service tor restart
		    sleep 2
		    ip2="$(proxychains curl https://ipecho.net/plain 2>/dev/null)"
	    done
    fi
	echo -e "\n${blueColour}[*]${endColour} Mi dirección IP actual es {$ip1}"
    let index=index+1;
    holehe "$linea" | grep -E "\*|\+|$linea"
done < $archivo
