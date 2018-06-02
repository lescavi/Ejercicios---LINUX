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
