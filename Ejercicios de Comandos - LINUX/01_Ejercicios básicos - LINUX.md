# Ejercicios Administración Linux 1

### Ejercicios Básicos.

#### RPM

- Determine el número de paquetes RPM actualmente instalados en su estación de trabajo.

```
[root@localhost lescavi]# rpm -qa | wc -l
```



- Verifique que el paquete coreutils está en su sistema (**con rpm**),
   luego determine de qué sirve con la ayuda de su manifiesto. ¿Puede 
    conseguir obtener sólo la descripción y nada más? Lea la página del 
    manual correspondiente para ampliar sus conocimientos.

```
[root@localhost lescavi]# rpm -qi coreutils
[root@localhost lescavi]# rpm -q -queryformat=%{DESCRIPTION}
```



- Intente suprimir el paquete coreutils. ¿Puede proporcionar la lista de las dependencias que le impiden hacerlo?

```
[root@localhost lescavi]# rpm -e coreutils
```



```
[root@localhost lescavi]# rpm -q --provides coreutils
```



- Descargue el paquete RPM de JRE (*Java Runtime Environment*) de Java ubicado en <http://www.java.com/en/download/manual.jsp>
   (tome la versión correspondiente a su arquitectura). Instale este 
    paquete indicando que quiere ver su nombre y una barra de progreso.

```
[root@localhost lescavi]# rpm -ivh jre1.8-1.8.0_171-fcs.x86_64.rpm
```



- Si el paquete ya estuviera instalado, ¿cómo habría podido 
  actualizarlo? Sabiendo que ya está instalado ahora, intente actualizar 
  este paquete sin condiciones. ¿En  qué caso puede ser necesario? 
  Finalmente, suprímalo.

```
[root@localhost lescavi]# rpm -Uvh jre1.8-1.8.0_171-fcs.x86_64.rpm
```



```
[root@localhost lescavi]# rpm -Uvh --force jre1.8-1.8.0_171-fcs.x86_64.rpm
```



#### DPKG y APT

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

```
root@debian:/home/lescavi# apt list | more

root@debian:/home/lescavi# dpkg -l | grep ^ii | wc -l
```



```
root@debian:/home/lescavi# dpkg -l | more

root@debian:/home/lescavi# dpkg -l "*coreutils*"
```



- Verifique que el paquete coreutils está en su sistema (**con apt**),
   luego determine de qué sirve con la ayuda de su manifiesto. ¿Puede 
    conseguir obtener sólo la descripción y nada más? Lea la página del 
    manual correspondiente para ampliar sus conocimientos.

```
root@debian:/home/lescavi# apt list coreutils

root@debian:/home/lescavi# dpkg-query -W coreutils
```



- Intente suprimir el paquete coreutils. ¿Puede proporcionar la lista de las dependencias que le impiden hacerlo?

```
root@debian:/home/lescavi# apt-get remove coreutils

root@debian:/home/lescavi# dpkg -r coreutils
root@debian:/home/lescavi# dpkg-query -W -f='${Provides}' coreutils
```



- Descargue el paquete APT de JRE (*Java Runtime Environment*) de Java ubicado en <http://www.java.com/en/download/manual.jsp>
   (tome la versión correspondiente a su arquitectura). Instale este 
    paquete indicando que quiere ver su nombre y una barra de progreso.

```
root@debian:/home/lescavi# sudo add-apt-repository ppa:webupd8team/java
root@debian:/home/lescavi# apt-get install jre1.8.0_73
root@debian:/home/lescavi# sudo apt-get update

root@debian:/home/lescavi# apt-cache search java8 | grep oracle

root@debian:/home/lescavi# apt-get install oracle-java8-installer

```



- Si el paquete ya estuviera instalado, ¿cómo habría podido 
  actualizarlo? Sabiendo que ya está instalado ahora, intente actualizar 
  este paquete sin condiciones. ¿En  qué caso puede ser necesario? 
  Finalmente, suprímalo.

```
root@debian:/home/lescavi# apt-get update | grep oracle
root@debian:/home/lescavi# apt-get upgrade
```



```
root@debian:/home/lescavi# apt-get remove | grep jre1.8.0_73
```

