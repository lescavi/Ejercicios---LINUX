#!/bin/bash

clear

echo "Introduce fichero de entrada:"
read file

if [[ -f $file ]]
	then
		if [[ -r $file && -w $file ]]
		then 
			chmod u+x,g+x $file
			ls -l $file
                fi
else
	echo "no existe fichero"
	exit 1;
fi 
