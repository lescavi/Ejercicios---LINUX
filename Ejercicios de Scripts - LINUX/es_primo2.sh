#!/bin/bash

clear

#Escriba una función llamada es_primo, que coja como parámetro un número y que devuelva el código de retorno 0 si el número es primo, o 1 en el caso contrario.

#Primero, leo la línea introducida por el usuario

echo " Introduce todos los numeros primos que quieras, separados por espacios"
read file
echo " "

# Aquí me dice cuantos caracteres hay en la línea. Esto lo usaremos después para introducir los valores en una Array.

num=$(echo $file | wc -w)

# En esta parte, comienzo a definir la Array con un contador que recorra las posiciones de la Array, sabiendo que la ultima posición es la variable $num que definimos anteriormente, menos una posición, ya que la primera posición de la array comienza en el cero. En resumen, recoge los valores introducidos por el usuario y los guarda en la array.

i=1
for ((e=0;e<$num;e++))
do

# $i va a recorrer las columnas que ha introducido el usuario, por ejemplo, si el usuario a introducido... 1 2 3 4, habrá un total de 4 columnas. anterior mente hemos definido $i = 1, pero después lo vamos a incrementar. Mientras $i sea menos que $num, seguirá funcionando. Es una forma de hacer un bucle con un if.

        if [ $i -le $num ]
        then

#Aquí es donde guardamos los valores en las posiciones de la array. $e es el contador y va a recorrer desde la posición 0 hasta el valor de $num - 1.  En las posiciones guardamos los valores que ha introducido el usuario($file), como están separados por espacios, hacemos un cut con los parámetros -f para que recorra las columnas ($i = al numero de columnas), -d para el carácter delimitador, que en este caso es un espacio. Después incrementamos $i.

                array[$e]=$(echo $file | cut -f $i -d " ")
                 i=$[$i+1]
        fi
done

# Listo, ya tenemos todos los valores en una Array. Ahora vamos a ver uno por uno si son primos. Primero, hacemos un Bucle que recorra todos los valores de la Array. (@). $numero será igual a el valor  de cada posición de la array.

for numero in ${array[@]}
do

# Hacemos un contador que va a ser $cn y lo ponemos a cero.
cn=0

# $t va a ser igual a los números por los que vamos a dividir $numero. Empezaremos desde el 1 hasta el valor del propio $numero. 

        for ((t=1;$t<=$numero;t++))
        do

# Mientras el contador sea menor que 3, el bucle seguirá funcionando, en caso de que no lo sea, se saldrá de el.

                if [[ $cn -lt 3 ]]
                then
                        sp=$[$numero % $t]

# Si $sp (que es el resto de dividir $numero entre $t) es igual a 0, incrementamos el contador. 

                        if [ $sp -eq 0 ]
                        then
                                cn=$[$cn+1]
                        fi
                else
                        break
                fi
        done

# Si el contador es igual a dos el $numero será primo, pero en el caso de que el contador sea un numero mayor de dos, $numero no será primo.

        if [[ $cn -eq 2 ]]
        then            
                echo "¡$numero es un número primo!"     
        else
                echo "Ups... Parece que $numero no es un número primo"
        fi
done
