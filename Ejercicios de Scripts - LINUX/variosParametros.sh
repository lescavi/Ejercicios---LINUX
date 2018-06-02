#!/bin/bash

clear

for i in $@
   do
	if [[ -f $i ]]
	     then echo "$i es fichero"
        elif [[ -d $i ]]
	     then echo "$i es directorio"
	fi
   done
