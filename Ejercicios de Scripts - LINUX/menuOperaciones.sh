#!/bin/bash

clear

#Menú operaciones

echo "Introduzca primer número: "
	read n1
echo
echo "Introduzca segundo número: "
	read n2
echo
echo "Seleccione la operación a realizar con los números "$n1" y "$n2""
echo
echo "1 -> Sumar"
s=$(($n1 + $n2))
echo "2 -> Restar"
r=$(($n1 - $n2))	
echo "3 -> Multiplicar"
m=$(($n1 * $n2))
echo "4 -> Dividir"
d=$(($n1 / $n2))
echo "5 -> Salir"
fin=$((Ctrl + c))
echo
echo "Introduzca el número de operación: "
	read op

if [[ $op == 1 ]]
	then 
		echo "Suma:"
		echo $n1 + $n2 = $s
		echo

	elif [[ $op == 2 ]] 
	then
		echo "Resta:"
		echo $n1 - $n2 = $r
		echo
	elif [[ $op == 3 ]]
	then 
		echo "Multiplica:"
		echo $n1 x $n2 = $m
		echo
	elif [[ $op == 4 ]]
	then 
		echo "Divide:"
		echo $n1 : $n2 = $d
		echo
	elif [[ $op == 5 ]]
	then 
		echo "Adiós!!!"
		echo $fin

	else 
		echo "Incorrecto!! Seleccione una opción del 1 al 4"
		
fi


