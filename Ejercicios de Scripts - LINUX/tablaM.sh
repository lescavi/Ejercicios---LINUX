#!/bin/bash

clear

echo "Intro número: "
read num

for i in $(seq $num)
	do
	  echo "$num*$i=$(($num*$i))"
	done
