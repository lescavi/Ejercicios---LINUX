# Ejercicios Administración Linux 1

### Ejercicios Básicos.

#### RPM

- Determine el número de paquetes RPM actualmente instalados en su estación de trabajo.
- Verifique que el paquete coreutils está en su sistema (**con rpm**),
   luego determine de qué sirve con la ayuda de su manifiesto. ¿Puede 
  conseguir obtener sólo la descripción y nada más? Lea la página del 
  manual correspondiente para ampliar sus conocimientos.
- Intente suprimir el paquete coreutils. ¿Puede proporcionar la lista de las dependencias que le impiden hacerlo?
- Descargue el paquete RPM de JRE (*Java Runtime Environment*) de Java ubicado en <http://www.java.com/en/download/manual.jsp>
   (tome la versión correspondiente a su arquitectura). Instale este 
  paquete indicando que quiere ver su nombre y una barra de progreso.
- Si el paquete ya estuviera instalado, ¿cómo habría podido 
  actualizarlo? Sabiendo que ya está instalado ahora, intente actualizar 
  este paquete sin condiciones. ¿En  qué caso puede ser necesario? 
  Finalmente, suprímalo.

#### APT

- Conteste a las preguntas 1 a 4 de la práctica anterior, pero con los
   comandos y paquetes dpkg equivalentes: coreutils está presente con el 
  mismo nombre. Sin embargo no cuenta con el paquete Java, vamos a 
  utilizar el paquete de Sky Enterprise (un cliente Lync/Skype Enterprise)
   que obtendrá aquí: <https://tel.red/linux.php>.
- APT es un gestor de metapaquetes: gestiona las dependencias en su 
  lugar y trabaja con repositorios, y no con paquetes individuales. Java 
  (oficial) se encuentra en un repositorio alternativo. El objetivo es 
  gestionar este repositorio y las instalaciones asociadas.
- Determine el número de paquetes **APT** actualmente instalados en su estación de trabajo.
- Verifique que el paquete coreutils está en su sistema (**con apt**),
   luego determine de qué sirve con la ayuda de su manifiesto. ¿Puede 
  conseguir obtener sólo la descripción y nada más? Lea la página del 
  manual correspondiente para ampliar sus conocimientos.
- Intente suprimir el paquete coreutils. ¿Puede proporcionar la lista de las dependencias que le impiden hacerlo?
- Descargue el paquete APT de JRE (*Java Runtime Environment*) de Java ubicado en <http://www.java.com/en/download/manual.jsp>
   (tome la versión correspondiente a su arquitectura). Instale este 
  paquete indicando que quiere ver su nombre y una barra de progreso.
- Si el paquete ya estuviera instalado, ¿cómo habría podido 
  actualizarlo? Sabiendo que ya está instalado ahora, intente actualizar 
  este paquete sin condiciones. ¿En  qué caso puede ser necesario? 
  Finalmente, suprímalo.

#### FUENTES

- Descárguese el fichero `ftp://ftp.proftpd.org/devel/source/proftpd-cvs-20170118.tar.gz` con el comando wget en su directorio home. Cree el directorio `~/proftpd` extraiga los ficheros.



#### DIRECTORIOS Y FICHEROS

- A partir de su directorio personal, cree la estructura siguiente utilizando un único comando:
- Vaya al directorio carpeta1 con una ruta absoluta y cree el archivo archivo1 en este directorio.
- Copie archivo1 en el directorio carpeta3 con una ruta relativa partiendo de la que esté actualmente.
- Vaya a la carpeta2 utilizando una ruta relativa, y copie el archivo 
  archivo1 de carpeta3 con el nombre archivo2 donde se encuentra usted.
- Suprima archivo1 del directorio carpeta3.
- Con rmdir suprime carpeta2, luego carpeta1 y todo su contenido. ¿Es posible? ¿Por qué? ¿Cómo conseguirlo?.
- ¿Cuál es el objetivo del comando ls -l [a-z]*. ??[ !0-9]?
- Cree un archivo llamado «-i» con una redirección: echo > -i. Intente suprimirlo.



#### BÚSQUEDA DE FICHEROS

- Visualice todos los archivos que tienen un tamaño inferior a 400 bytes y los derechos 644.
- Visualice todos los archivos en su directorio personal que tienen un tamaño inferior a 400 bloques.
- Liste en formato largo todos los archivos de su propio sistema que fueron modificados hace más de 7 días.
- Liste y visualice en formato largo los archivos en su directorio 
  personal que tienen como propietario "lescavi" o que tienen un tamaño 
  entre 512 y 1024 bytes, ambas cantidades incluidas.
- Busque todos los archivos vacíos del sistema que no pertenecen a root
   e intente suprimirlos. Utilice los parámetros -empty y -exec
- Indique dónde se encuentra el comando binario ls.
- El comando **find /** devuelve muchos errores si un 
  simple usuario lo utiliza debido a un problema de permisos. Evite los 
  mensajes de error redireccionándolos hacia un «agujero negro» (`/dev/null`).
- En el caso anterior y a pesar de los errores, sigue teniendo acceso a
   muchas ubicaciones y se visualiza una lista muy larga que, por lo 
  tanto, no se puede aprovechar. Coloque esta lista en un archivo llamado 
  resultado.
- Ahora, no se visualiza nada. Finalmente, para saber por qué no puede 
  acceder a determinados directorios, va a obtener también los mensajes de
   error en el archivo resultado, con la lista de los archivos. Haga una 
  redirección del canal de error estándar en el canal de salida estándar.
- No se visualiza nada más. Quiere ambas cosas: un archivo y la 
  visualización de los resultados en pantalla. Se utiliza el comando **tee**
   con una tubería: permite recuperar un flujo saliente, colocarlo en un 
  archivo y volver a sacar este flujo como si no hubiera pasado nada, es 
  decir, se muestra la salida por pantalla y puede pasar con `tee [archivo]` el resultado también a un archivo.

#### FILTROS Y HERRAMIENTAS

- El archivo /etc/passwd es un gran clásico en Unix. Se compone de 
  siete campos separados por «:»: 
  login:passwd:UID:GID:Comentario:homedir:shell. Recupere la línea del 
  usuario root en /etc/passwd:
- En esa línea anterior, recupere sólo el UID de root (utilizar **cut**)
- Cuente el número de usuarios que contiene este archivo usando una redirección en entrada. (**<**).
- Un poco más complicado: recupere la lista de los GID, ordénelos por orden creciente y suprima los duplicados.
- De ahí, extrapole el número de grupos diferentes utilizados.
- Convierta todos los logins a mayúsculas (es decir, los nombres de cuentas en /etc/passwd).
- Aísle ahora la octava línea de /etc/passwd.

#### PROCESOS

- Inicie el proceso sleep 1000 en segundo plano. Recupere su PID.
- Vuelva a colocar este proceso en primer plano, luego párelo (no lo mate) y de nuevo mándelo a segundo plano.
- Revise el PID del proceso anterior y muestre los detalles de sólo este proceso.
- Modifique la prioridad de este proceso y paselo a un factor 10.
- Liste de nuevo el detalle de este proceso, pero con formato largo. Mire el valor de la columna NI.
- Mande la señal 15 a este proceso. Esto va a terminarlo. Aunque también se puede elegir la señal 9. Lee la ayuda de `man kill`y `man 7 signal` para revisar el uso de kill y las señales de sistema.



