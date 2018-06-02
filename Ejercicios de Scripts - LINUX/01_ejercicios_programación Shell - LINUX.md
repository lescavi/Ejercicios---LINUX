# Programación Shell Nivel 1

### Ejercicios Básicos scripts Linux 01

- Objetivo: en un archivo de texto (num.txt) tenemos las líneas siguientes:

```
1 3
5 7
12 19
```



Escriba un script que acepte ese archivo como parámetro y verifique 
se sólo se pasa un argumento, que lo lea y que para cada una de sus 
líneas calcule la suma de dos números y la muestre con la forma 
siguiente:

```
1 + 3 = 4
5 + 7 = 12
12 + 19 = 31
```



```
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
```



- Escriba una función llamada es_primo, que coja como parámetro un número y que devuelva el código de retorno 0 si el número es primo, o 1 en el caso contrario.

```
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
```



Los scripts deben controlar todos los posibles errores, si el número 
de parámetros no es el correcto, se mostrará al usuario cuáles son las 
posibles opciones para su ejecución.



- Escriba un script que elimine un archivo o directorio pasado como 
  parámetro, y le pregunte si está seguro de llevar a cabo la acción.

```
#!/bin/bash

clear

#Escriba un script que elimine un archivo o directorio pasado como parámetro, y le pregunte si está seguro de llevar a cabo la acción.

echo "Escribe el nombre de un archivo o directorio que deseas borrar "
echo "(incluye su ruta absoluta)."
echo "Para salir pulsa ""(Ctrl+c)"""

read nfile

if [[ $? = 0 ]]
then
echo "comprobando............."
    	rm -rfi $nfile

fi
```



- Escribir un script que pueda mostrar información de un comando al ejecutar dicho script y pasar como parámetro el comando.

```
#!/bin/bash

clear

#Escribir un script que pueda mostrar información de un comando al ejecutar dicho script y pasar como parámetro el comando. 

echo "Escribe el nombre de un comando"
    read comando 
if [[ $(man $comando) ]]
	then                                                
	man $comando     
	else  		
	echo "El comando es incorrecto"

fi
```



- Escribir un script que al pasarle por argumento un parámetro, determine si es archivo, directorio, o si el parámetro no existe.

```
#!/bin/bash

clear

echo "- Verifica si es fichero, directorio o no se pasa parámetro. 
- Uso: ./script <parámetro>"
echo
if [[ $# != 1 ]]
	then 
		echo "Error en el número de parámetros. Uso programa.sh <argumento>"
		exit 1
elif [[ -f $1 ]]
	then
		echo "$1 es un fichero regular"
		echo
	exit 0;
elif [[ -d $1 ]]
	then
		echo "$1 es un directorio"
		echo
	exit 0;
else 
		echo "¡¡ Error, no es ni fichero ni directorio !!"
		echo
	exit 0;
fi
```



- Realiza un script que compruebe si el usuario actual del sistema es 
  existe, si es así visualiza su nombre 5 veces, sino te despides de él 
  amigablemente.

```
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
```



- Tenemos un menu principal:

   . (1) Suma

  Lee dos números y los suma.

  . (2) Resta

  Lee dos números y los resta.

  . (3) Multiplicación

  Lee dos números y los multiplica.

  . (4) División

  Lee dos números y los divide.

  . (5) Salir

  Termina el script.

  ​

```
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
```



- En un fichero tengo una palabra clave. Haz un script que muestre si dicha palabra es el parámetro pasado o no.

```
#!/bin/bash

clear

#En un fichero tengo una palabra clave. Haz un script que muestre si dicha palabra es el parámetro pasado o no.

echo "Introduce la palabra a buscar:"

read u

r=$(cut -d: -f1 palabrasC.txt | grep $u)

if [[ $? == 0 ]]
        then
		echo
		echo " La palabra $u, se encuentra en el fichero: palabrasC.txt"
		echo

        else
		echo
		echo " $u, no se encuentra en el fichero: palabrasC.txt"
		echo

fi
```



- Nos pide la edad y nos dice si es mayor de edad o menor.

```
#!/bin/bash

clear

#Nos pide la edad y nos dice si es mayor de edad o menor.

		echo "Introduzca el año de nacimiento"

hoy=$(date +%d-%m-%Y | cut -d- -f3)

read an
		echo

r=$(( hoy - an ))
		echo
		echo "Tienes $r años."  

if [[ $r -ge 18 ]]
	then
		echo
		echo "Eres mayor de edad"
		echo

	else 
		echo 
		echo "Eres menor de edad."
		echo
fi
```



- Script que reciba un nombre de fichero, verifique que existe y que es
   un fichero de lectura-escritura, lo convierta en ejecutable para el 
     usuario y el grupo y muestre el estado final de los permisos.


```
#!/bin/bash

clear

echo "Introduce fichero de entrada:"
read file

if [[ -f $file ]]
	then
		if [[ -r $file && -w $file ]]
		then 
			chmod u+x,g+x $file
			ls -l $file
                fi
else
	echo "no existe fichero"
	exit 1;
fi 
```



- Script que nos diga al pulsar una tecla, si es letra, numero o caracter especial.


```
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
```



- realizar un script que reciba varios parametros y nos diga cuantos de
   esos parametros son de directorios y cuantos son archivos. $# contador 
     que indica cuantos parametros se pasan.


```
#!/bin/bash

clear

for i in $@
   do
	if [[ -f $i ]]
	     then echo "$i es fichero"
        elif [[ -d $i ]]
	     then echo "$i es directorio"
	fi
   done
```



- Mostramos menu, con productos para vender, luego nos pide que 
  introduzcamos la opcion. luego mensaje que indica que introduzca moneda.
   Si ponemos precio exacto nos da mensaje, "Gracias buen provecho", si 
  ponemos menos, nos diga falta.
  Si poner mas valor, nos indique el cambio con mensaje.


```
#!/bin/bash

clear

echo "Tostada = 3€, Café = 2€, Sandwich = 4€"
select op in tostada cafe sandwich salirdelbar 
do
    case $op in
	tostada) 
	       echo "introduce importe";
	       read p;
	       if [[ $p == 3 ]]
	          then echo "Buen provecho"
		elif [[ $p < 3 ]]
		  then echo "Falta dinero"
	        else
		   echo "Cambio $((p-3))"
                fi
		;;
        cafe)
               echo "introduce importe";
               read p;
               if [[ $p == 2 ]]
                  then echo "Buen provecho"
                elif [[ $p < 2 ]]
                  then echo "Falta dinero"
                else
                   echo "Cambio $((p-2))"
                fi
                ;;
        sandwich)
               echo "introduce importe";
               read p;
               if [[ $p == 4 ]]
                  then echo "Buen provecho"
                elif [[ $p < 4 ]]
                  then echo "Falta dinero"
                else
                   echo "Cambio $((p-4))"
                fi
                ;;
	salirdelbar) exit ;;
	esac
done
```



- Realizar un script que pida introducir la ruta de un directorio por 
  teclado (Hay que validar que la variable introducida sea un directorio) 
  nos diga cuantos archivos y cuantos directorios hay dentro de ese 
  directorio.


```
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
```



- Realiza un script que introduzca número por parámetro y muestre tabla de multiplicar.


```
#!/bin/bash

clear

echo "Intro número: "
read num

for i in $(seq $num)
	do
	  echo "$num*$i=$(($num*$i))"
	done
```

