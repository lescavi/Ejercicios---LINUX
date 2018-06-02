#!/bin/bash

clear

existeuser(){
	
	echo "Introduzca usuario a buscar: "
	read user
	if [[ $(grep $user: /etc/passwd) ]]
		then echo "$user existe"
	else echo "Usuario $user no existe"
	fi
}

creauser(){
	echo "Introduzca usuario para crear: "
        read user
        if [[ $(grep $user: /etc/passwd) ]]
                then echo "$user existe";
		     exit 1;	
        else sudo adduser $user
        fi	

}
creagrupo(){

	echo "Introduzca grupo a crear: "
        read grupo
        if [[ $(grep $grupo: /etc/group) ]]
                then echo "$grupo existe"
        else sudo addgroup $grupo
        fi

}

cambiapass(){

	echo "Introduce usuario para cambiar contraseña: "
	read user
	sudo passwd $user


}


while true 
  do
		echo "a) Verifica si existe usuario (Por teclado)"
		echo "b) Crea usuario con nombre introducido por teclado"
		echo "c) Crea un grupo creado por teclado"
		echo "d) Cambia password a usuario"
		echo "e) Salir"
		echo "Opción: "
		read opt
	case $opt in	
		a) existeuser;;
		b) creauser;;
		c) creagrupo;;
		d) cambiapass;;
		e) exit;;
	esac
  done	
