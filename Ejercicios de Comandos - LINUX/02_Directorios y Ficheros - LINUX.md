# Ejercicios Administración Linux 1

#### FUENTES

- Descárguese el fichero `ftp://ftp.proftpd.org/devel/source/proftpd-cvs-20170118.tar.gz` con el comando wget en su directorio home. Cree el directorio `~/proftpd` extraiga los ficheros.


```
root@debian:~# wget ftp://ftp.proftpd.org/devel/source/proftpd-cvs-20180520.tar.gz ../home

root@debian:~# tar xvzf proftpd-cvs-20170118.tar.gz
root@debian:~# mv xvzf proftpd-cvs-20170118 proftpd
root@debian:~# cd proftpd
root@debian:~# ./configure -prefix=/opt/proftpd
root@debian:~# make
root@debian:~# sudo make install
root@debian:~# /opt/proftpd/sbin/proftpd --version
```




#### DIRECTORIOS Y FICHEROS

- A partir de su directorio personal, cree la estructura siguiente utilizando un único comando:


```
|-----carpeta1 
|		|-----carpeta3 
|-----carpeta2 
| 		|-----carpeta4
```



```
lescavi@debian:~/pruebas$ mkdir -p carpeta1/carpeta3 && mkdir -p carpeta2/carpeta4
```



- Vaya al directorio carpeta1 con una ruta absoluta y cree el archivo archivo1 en este directorio.


```
lescavi@debian:~/pruebas$ mkdir -p carpeta1/carpeta3 && mkdir -p carpeta2/carpeta4
```



- Copie archivo1 en el directorio carpeta3 con una ruta relativa partiendo de la que esté actualmente.


```
lescavi@debian:~/pruebas$ mkdir -p carpeta1/carpeta3 && mkdir -p carpeta2/carpeta4
```



- Vaya a la carpeta2 utilizando una ruta relativa, y copie el archivo 
  archivo1 de carpeta3 con el nombre archivo2 donde se encuentra usted.


```
lescavi@debian:~/pruebas/carpeta1$ cd ../carpeta2 && cp ../carpeta1/carpeta3/archivo1 archivo2
```



- Suprima archivo1 del directorio carpeta3.


```
lescavi@debian:~/pruebas/carpeta1$ cd ../carpeta2 && cp ../carpeta1/carpeta3/archivo1 archivo2
```



- Con rmdir suprime carpeta2, luego carpeta1 y todo su contenido. ¿Es posible? ¿Por qué? ¿Cómo conseguirlo?.


`No se puede por que estoy situado dentro del directorio a borrar (carpeta2) tampoco deja por que no está vacio. Hay que forzarlo. Y como hay ficheros hay que usar "rm -rf".`



```
lescavi@debian:~/pruebas/carpeta2$ cd ../ && rm -rf carpeta2 && rm -rf carpeta1
```



- ¿Cuál es el objetivo del comando ls -l [a-z]*. ??[ !0-9]?


```
El archivo empieza con una letra de "a - z" y termina por 4 caractéres. El punto, dos caracteres cualesquiera y el último, que es cualquier cosa excepto una cifra. Se muestran los detalles de los archivos que corresponden a este criterio. 
```



- Cree un archivo llamado «-i» con una redirección: echo > -i. Intente suprimirlo.


```
root@debian:/home/lescavi# >-i
root@debian:/home/lescavi# ls
Descargas   Escritorio	Imágenes  nginx-1.13.10		Plantillas  Público
Documentos  -i		Música	  nginx-1.13.10.tar.gz	pruebas     Vídeos
root@debian:/home/lescavi# rm ./-i
rm: falta un operando
Pruebe 'rm --help' para más información.
root@debian:/home/lescavi# rm -- -i
root@debian:/home/lescavi# ls
Descargas   Escritorio	Música	       nginx-1.13.10.tar.gz  pruebas  Vídeos
Documentos  Imágenes	nginx-1.13.10  Plantillas	     Público
```

