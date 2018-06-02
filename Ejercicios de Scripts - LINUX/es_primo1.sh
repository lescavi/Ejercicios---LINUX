#!/bin/bash  
# La versión que mandé sólo teníais que ver que fuera par o impar el número
# realmente esa versión no es correcta, ya que un num primo sólo es divisible por él mismo y por 1.
# Casos especiales el 1 y 2

# Si queremos resolver el problema realmente se puede sacar de la idea de que únicamente será divisible por el mismo número y uno
# partiendo desde todos los números anteriores hasta el l.
# Es decir, si quiero comprobar que el 7 es primo, divido 7/1, 7/2, .., 7/7. Para ello utilizarmos el módulo porque si sale 0 
# será divisible si no, no lo es. por eso si 7 % 2 = 1, no es divisible, 7 % 1 = 0, es divisible. 
# El truco está en hacerse un contador que sume cuando es divisible, y si al final tenemos dos, pues es primo, si no, no lo es. 

echo "Introduce número: "
read num

divisor=0

if [[ $num == 1 ]]
then 
	echo "$num - No es primo."
	echo
	exit 1;
elif [[ $num == 2 ]]
        then
        echo "$num - Es primo.";
	echo
        exit 0;
fi
for i in $(seq $num)
        do
           if [[ $((num % i)) == 0 ]]
                then divisor=$((divisor+1))
           fi
        done
if [[ $divisor == 2 ]]
        then echo "$num - Es primo."
	echo
        exit 0;
else
        echo "$num - No es primo.";
	echo
        exit 1;
fi
