#!/bin/bash

clear

options=("Tres carpetas con más uso de espacio en HOME" "Muestre el punto de montaje con más porcentaje de uso y su ruta de montaje" "Salir")
select opt in  "${options[@]}" 
	do
		case $opt in
			"Tres carpetas con más uso de espacio en HOME") du -h $HOME | sort -k1 -r -n | head -n3;;
			"Muestre el punto de montaje con más porcentaje de uso y su ruta de montaje") df -h | tr -s " " | cut -f1,3,6 -d " " | head -2;; 
			"Salir") exit;;
		esac
	done
