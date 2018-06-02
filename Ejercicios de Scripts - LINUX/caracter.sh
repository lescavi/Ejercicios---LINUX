#!/bin/bash

clear

echo "Introduce carácter de entrada para verificar su tipo:"
read car
case $car in
	[0-9]) echo "es número";;
	[a-z]) echo "es una letra";;
	[-@#$%'&'*=+]) echo "carácter especial";;
	*) echo "es otra cosa";;
esac
