# Ejercicios Administración Linux 1

#### PROCESOS

- Inicie el proceso sleep 1000 en segundo plano. Recupere su PID.


```
lescavi@Javier-PC ~ $ sleep 1000 &
[1] 22070
lescavi@Javier-PC ~ $ ps
  PID TTY          TIME CMD
19909 pts/0    00:00:00 bash
22070 pts/0    00:00:00 sleep
22071 pts/0    00:00:00 ps
```



- Vuelva a colocar este proceso en primer plano, luego párelo (no lo mate) y de nuevo mándelo a segundo plano.


```
lescavi@Javier-PC ~ $ fg
sleep 1000
(Ctrl+Z)
[1]+  Detenido                sleep 1000

lescavi@Javier-PC ~ $ bg
[1]+ sleep 1000 &

lescavi@Javier-PC ~ $ ps
  PID TTY          TIME CMD
19909 pts/0    00:00:00 bash
22070 pts/0    00:00:00 sleep
22115 pts/0    00:00:00 ps
```



- Revise el PID del proceso anterior y muestre los detalles de sólo este proceso.


```
lescavi@Javier-PC ~ $ ps p 22070 -f
UID        PID  PPID  C STIME TTY      STAT   TIME CMD
lescavi  22070 19909  0 12:35 pts/0    S      0:00 sleep 1000
```



- Modifique la prioridad de este proceso y paselo a un factor 10.

```
lescavi@Javier-PC ~ $ renice 10 22070
22070 (process ID) prioridad antigua 0, prioridad nueva 10
```



- Liste de nuevo el detalle de este proceso, pero con formato largo. Mire el valor de la columna NI.


```
lescavi@Javier-PC ~ $ ps p 22070 -l
F S   UID   PID  PPID  C PRI  NI ADDR SZ WCHAN  TTY        TIME CMD
0 S  1000 22070 19909  0  90  10 -  2451 restar pts/0      0:00 sleep 1000
```



- Mande la señal 15 a este proceso. Esto va a terminarlo. Aunque también se puede elegir la señal 9. Lee la ayuda de `man kill`y `man 7 signal` para revisar el uso de kill y las señales de sistema.


```
lescavi@Javier-PC ~ $ kill -15 22070

lescavi@Javier-PC ~ $  ps
  PID TTY          TIME CMD
19909 pts/0    00:00:00 bash
22161 pts/0    00:00:00 ps
[1]+  Terminado               sleep 1000
```

