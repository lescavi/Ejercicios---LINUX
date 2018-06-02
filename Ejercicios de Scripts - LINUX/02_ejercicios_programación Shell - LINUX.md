# Programación Shell Nivel 1

### Ejercicios Básicos scripts Linux 02

- Realizar scriptse (**logfecha.sh**) que escribe la fecha en formato 'dd/mm/aaaa hh:mm:ss' cada X segundos en el log '~/alerta.log'. De tal forma que el script cumpla lo siguiente:

  . Acepte sólo un parámetro de entrada: `logfecha.sh 2`

  . Verifique qué solo se le pase un parámetro y este sea numérico, sino, salida con error.

  . En caso de que el parámetro sea **-h** ó **--help** imprime un mensaje:

```
Forma de uso: ./logfecha.sh segundos
Donde segundos es el tiempo de retardo en mostrar la fecha y debe ser un número entero
```


- Se va a realizar un script que simule un demonio o servicio: cuyos estados serán: `start, stop, status y restart`. El script debe llamarse con `./servicio1.sh start|stop|restart|status` y debe realizar lo siguiente según opción seleccionada como argumento (se recomienda el uso de funciones para cada opción):

  . `start`: verifica si está el servicio ejecutando, si es así, sale del script con salida exit 0 y con el mensaje de servidio ejecutándose. Si no, lanza el proceso en background (para hacer pruebas utilizar como ejemplo un sleep 20000) y envía su pid al fichero `/tmp/pidfile`.

  . `stop`: para el servicio (kill) y elimina el fichero `/tmp/pidfile``

  . `restart`: para el servicio y lo inicia

  . `status`: si existe `/tmp/pidfile` el proceso está ejecutándose. En caso contrario, no lo está.

Se recomienda realizar el script con case y con funciones.También poner la opción de ayuda (`--h --help`) con el siguiente mensaje:

```
SYNOPIS
    ./servicio1 start|stop|restart|status
DESCRIPCIÓN
    Muestra que arraca, para, relanza y nos muestra el estado del proceso
CÓDIGOS DE RETORNO
    0 Si no hay ningún error.
```

```
#!/bin/bash

clear

echo "- Modo de hacerlo: 
- ./servicio1.sh (aquí pones start|stop|restart|status)
- a continuación el nombre del servicio"


start(){

if [[ -f /tmp/pidfile ]]
	then echo "Proceso en ejecución"
else
   sleep 20000 &
   pgrep sleep > /tmp/pidfile
   echo "Proceso en ejecución"
fi
}

stop(){
if [[ -f /tmp/pidfile ]]
	then
            p=$(cat /tmp/pidfile)
	    kill -9 $p
	    rm -f /tmp/pidfile
	    echo "Proceso elminado"
else 
   echo "Proceso parado"
fi
}

restart(){
stop;
start;
}

status(){
	if [[ -f /tmp/pidfile ]]
	then echo "Proceso ejecutándose"
	else echo "Proceso parado"
	fi
}

case $1 in

 start) start;;
 stop) stop;;
 restart) restart;;
 status) status;;
 *) echo "no se reconoce parámetro. Uso: servicio.sh start|stop|status|restart"
esac
```



- Realiza un script que haga copias de seguridad ( copiatotal.sh ) de una carpeta doc_copiar y deje la copia comprimida y empaquetada en la carpeta ~/copias

  **Para dicho script se tienen en cuenta lo siguiente:**

. Crear en una carpeta **doc_copiar** donde tengas una serie de carpetas y ficheros en ella. Esto lo puedes dejar en una variable para que te sea más cómodo.

. Deja también en otra variable la ubicación donde van a estar las copias:

~/copias

. Hacer una variable con la fecha en el formato indicado (aaaa.mm.dd-HH.MM.SS)

. El script se llama sin parámetros y verifica que origin y fuente sean Directorios.

. Para hacer empaquetados y comprimidos utilizar: `tar cvzf archivo.tar.gz copia_total`. Las opciones c, v, z, f son las necesarias para crear dicho fichero en modo verboso y comprimido en gzip. Para extraer sería con las opciones zxvf.

. El fichero comprimido con la copia tiene que tener el nombre de esta forma: **total-2018.05.11-19:00:00.tar.zip**

. Cuando se haga la copia llevar al fichero **~/copias/fecha-ultima-copia-total.txt** la fecha de la última copia. Se puede hacer con un echo de la variable que contenga la fecha.

```
#!/bin/bash

clear

origen=doc_copiar
destino=copias
timestamp=$(date +%Y.%M.%d-%H.%M.%S)

if [[ -d $origen && -d $destino ]]
then
	tar cvzf $destino/backup_$timestamp.tar.gz $origen
	echo $timestamp >> copias.txt
else
	echo "No existe origen y/o destino"
		exit 1;
fi
```



- Se tiene el siguiente fichero **roles.csv**:

```
Empleado:Rol:Proyecto
user1:Sistemas:123
user2:Desarrollo:7789
user3:Operario:6567
user4:Desarrollo:3433
user5:Operario:0943
user6:Sistemas:435
user7:Desarrollo:1134
```

. Programar un script **roles.sh** donde procese el fichero anterior que estará en ~

. El script debe mostrar el siguiente menú y realizar lo siguiente:

```
a) Ordenar alfabéticamente de forma inversa por proyecto
b) Ordenar alfabéticamente por usuario
c) Buscar usuario por teclado y mostrar: user1 Sistemas 123
d) Salir
   
```

. Se recomienda quitar el encabezado con `sed 1d`

. También se recomienda quitar los `":"` y dejar un único espacio para que sort trabaje de manera correcta

```
#!/bin/bash

clear

while true
	do
		echo "a) Ordenar alfabéticamente de forma inversa por proyecto"
		echo "b) Ordenar alfabéticamente por usuario"
		echo "c) Buscar usuario por teclado y mostrar: user1 Sistemas 123"
       	        echo "d) Salir"
		echo "#Opción: "
	        	read var
		case $var in
		    a)  cat roles.csv | sed 1d | tr ":" " " | sort -k3 -r -n ;;
		    b)  cat roles.csv | sed 1d | tr ":" " " | sort -k2  ;;
		    c)  

		echo "introduce usuario: "
			read user
                        ex=$(grep $user roles.csv)
			if [[ ! -z $ex ]]
				then "Existe usuario $ex"
			else echo "no existe"
			fi
			;;
		d) exit 0;;
	esac
done
```



- Realizar un script (**usodisco.sh**) que tenga dos opciones:

  a. Muestra las 3 carpetas con más uso de espacio del ~: (comando du)

```
340K    /home/ubuntu/.c9
136K    /home/ubuntu/.cache
84K     /home/ubuntu/.gnupg
```



​	b. Muestre el punto de montaje con más porcentaje de uso y su ruta de montaje:

```
/dev/mapper/volg1-lvdata 25% /mnt
```



Si hacéis un df -h sale lo siguiente:

```
 $ df -h
Filesystem                Size  Used Avail Use% Mounted on
none                      2.2G  7.4M  2.0G   1% /
tmpfs                      26G     0   26G   0% /dev
tmpfs                      26G     0   26G   0% /sys/fs/cgroup
/dev/mapper/volg1-lvdata  1.2T  293G  889G  25% /mnt
shm                        64M     0   64M   0% /dev/shm
tmpfs                      26G     0   26G   0% /sys/firmware
ivanjimenez:~/workspace $ 
```

```
#!/bin/bash

options=("Tres carpetas con más uso de espacio en HOME" "Muestre el punto de montaje con más porcentaje de uso y su ruta de montaje" "Salir")
select opt in  "${options[@]}" 
	do
		case $opt in
			"Tres carpetas con más uso de espacio en HOME") du -h $HOME | sort -k1 -r -n | head -n3;;
			"Muestre el punto de montaje con más porcentaje de uso y su ruta de montaje") df -h | tr -s " " | cut -f1,3,6 -d " " | head -2;; 
			"Salir") exit;;
		esac
	done
```



- Realizar un script de gestión de usuarios (**admuser.sh**) que, con el siguiente

  menú, se realicen las opciones siguientes:

```
****************************************************************
***  Gestión de Usuarios y Grupos ******************************
a) Verifica si existe usuario (Por teclado)
b) Crea usuario con nombre introducido por teclado
c) Crea un grupo creado por teclado
d) Cambia password a usuario
e) Salir
*****************************************************************
```



`*Nota: useradd, groupadd, passwd, deluser, delgroup`

```
#!/bin/bash

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
```

