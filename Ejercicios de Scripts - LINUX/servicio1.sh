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
