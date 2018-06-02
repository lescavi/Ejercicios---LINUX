#!/bin/bash

clear

#Realiza un script que compruebe si el usuario actual del sistema exite, si es así visualiza su nombre 5 veces, sino te despides de él amigablemente.

echo "Introduce un usuario:"
read u
r=$(cut -d: -f1 /etc/passwd | grep $u)

if [[ $? == 0 ]]
        then
		echo
		echo " Hello $r..."
		echo " Ciao $r..."
		echo " Salut $r..."
		echo " Hallo $r..."
		echo " Hola $r..."
		echo

        else
		echo
		echo " $u. no es usuario del sistema!!!"
		echo
		echo " A tomar por c*** de aquí...!"
		echo

fi
