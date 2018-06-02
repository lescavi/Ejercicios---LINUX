#!/bin/bash

clear

origen=doc_copiar
destino=copias
timestamp=$(date +%Y.%M.%d-%H.%M.%S)

if [[ -d $origen && -d $destino ]]
then
	tar cvzf $destino/backup_$timestamp.tar.gz $origen
	echo $timestamp >> copias.txt
else
	echo "No existe origen y/o destino"
		exit 1;
fi
