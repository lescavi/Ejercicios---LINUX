# Ejercicios Administración Linux 1

#### FILTROS Y HERRAMIENTAS

- El archivo /etc/passwd es un gran clásico en Unix. Se compone de 
  siete campos separados por «:»: 
  login:passwd:UID:GID:Comentario:homedir:shell. Recupere la línea del 
  usuario root en /etc/passwd

```
lescavi@Javier-PC ~ $ grep ^root: /etc/passwd
```



- En esa línea anterior, recupere sólo el UID de root (utilizar **cut**)

```
lescavi@Javier-PC ~ $ grep ^root: /etc/passwd | cut -d: -f3
```



- Cuente el número de usuarios que contiene este archivo usando una redirección en entrada. (**<**).

```
lescavi@Javier-PC ~ $ wc -l < /etc/passwd
```



- Un poco más complicado: recupere la lista de los GID, ordénelos por orden creciente y suprima los duplicados.

```
lescavi@Javier-PC ~ $ cut -d: -f4 /etc/passwd | sort -n | uniq
```



- De ahí, extrapole el número de grupos diferentes utilizados.

```
lescavi@Javier-PC ~ $ cut -d: -f4 /etc/passwd | sort -n | uniq | wc -l
```



- Convierta todos los logins a mayúsculas (es decir, los nombres de cuentas en /etc/passwd).

```
lescavi@Javier-PC ~ $ cut -d: -f1 /etc/passwd | tr "[a-z]" "[A-Z]"
```



- Aísle ahora la octava línea de /etc/passwd.

```
lescavi@Javier-PC ~ $ grep -n "" /etc/passwd | grep ^8: | cut -d: -f2-
```

