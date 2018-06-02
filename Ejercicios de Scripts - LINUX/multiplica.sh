#!/bin/bash

clear 
echo "introduce numero: "
read numero

for i in 0 1 2 3 4 5 6 7 8 9 10
do
	resultado=$(($numero*$i))
	echo "$numero x $i = $resultado"
done
