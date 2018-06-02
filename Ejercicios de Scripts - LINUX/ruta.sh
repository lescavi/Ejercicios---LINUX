#!/bin/bash

clear

dir=0
file=0
echo "introduce un directorio"
read ruta
a=$(basename $ruta)
if [[ -d $a ]]
        then
                $(ls -l $ruta | cut -d " " -f1 | sed 1d > dirarc.txt)
                d=$(cat dirarc.txt)
                #echo $d
                for i in $d
                do
                        if [[ $(echo $i | grep ^d) ]]
                                then
                                        echo "dir";
                                        dir=$((dir+1));

                        elif [[ $(echo  $i | grep ^-) ]]
                                then echo "file";
                                        file=$((file+1));

                        fi

                done


        else
                echo "no es un directorio"
fi

echo "ndir: $dir"
echo "nfile: $file"
