# Ejercicios Administración Linux 1


#### BÚSQUEDA DE FICHEROS

- Visualice todos los archivos que tienen un tamaño inferior a 400 bytes y los derechos 644.

```
lescavi@Javier-PC ~ $ find / -size -400c -perm 644 -print
```



- Visualice todos los archivos en su directorio personal que tienen un tamaño inferior a 400 bloques.

```
lescavi@Javier-PC ~ $ find ~ -size -400b -print
```



- Liste en formato largo todos los archivos de su propio sistema que fueron modificados hace más de 7 días.

```
lescavi@Javier-PC ~ $ find / -user lescavi -mtime +7 -ls
```



- Liste y visualice en formato largo los archivos en su directorio 
  personal que tienen como propietario "lescavi" o que tienen un tamaño 
  entre 512 y 1024 bytes, ambas cantidades incluidas.

```
root@debian:/home/lescavi# find ~ -user lescavi -size +512c -size -1024c -ls
```



- Busque todos los archivos vacíos del sistema que no pertenecen a root
   e intente suprimirlos. Utilice los parámetros -empty y -exec

```
root@debian:/home/lescavi# find / -type f empty -exec rm -f {} \;
```



- Indique dónde se encuentra el comando binario ls.

```
root@debian:/home/lescavi# whereis -b ls
```



- El comando **find /** devuelve muchos errores si un 
  simple usuario lo utiliza debido a un problema de permisos. Evite los 
  mensajes de error redireccionándolos hacia un «agujero negro» (`/dev/null`).

```
root@debian:/home/lescavi# find / 2>/dev/null
```



- En el caso anterior y a pesar de los errores, sigue teniendo acceso a
   muchas ubicaciones y se visualiza una lista muy larga que, por lo 
     tanto, no se puede aprovechar. Coloque esta lista en un archivo llamado 
     resultado.

```
root@debian:/home/lescavi# find / 1>resultado.txt 2>/dev/null
```



- Ahora, no se visualiza nada. Finalmente, para saber por qué no puede 
  acceder a determinados directorios, va a obtener también los mensajes de
   error en el archivo resultado, con la lista de los archivos. Haga una 
  redirección del canal de error estándar en el canal de salida estándar.

```
root@debian:/home/lescavi# find / >resultado.txt 2>&1
```



- No se visualiza nada más. Quiere ambas cosas: un archivo y la 
  visualización de los resultados en pantalla. Se utiliza el comando **tee**
   con una tubería: permite recuperar un flujo saliente, colocarlo en un 
  archivo y volver a sacar este flujo como si no hubiera pasado nada, es 
  decir, se muestra la salida por pantalla y puede pasar con `tee [archivo]` el resultado también a un archivo.

```
root@debian:/home/lescavi# find / 2>&1 | tee resultado
```

