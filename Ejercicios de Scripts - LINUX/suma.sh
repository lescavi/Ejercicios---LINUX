#!/bin/bash
                                                                                                        
#La suma es: 1+3=4
#La suma es: 5+7=12
#La suma es: 12+19=31

clear


cat num.txt | while read line
	
	do 
 	  a=$(echo $line | cut -f1 -d" ")
	  b=$(echo $line | cut -f2 -d" ")
          c=$(( a+b ))
	
	echo "La suma es: $a + $b = $c"
done

