#!/bin/bash
set -e

NWORDS=0
FICHERO=comands.txt

if [ $# -lt "2" ];then
   echo "Debes introducir dos parámetros"
   exit 1
fi

##Una vez comprobamos que el numero de parámetros es correcto, procedemos a confirmar si el fichero existe, de ser así no se hace el wget del server. En mi caso he subido un archivo .txt a un hfs para la prueba.
if ! [ -f "$FICHERO" ]; then
   wget http://$1/$FICHERO
else 
   read -p "El $FICHERO existe, ¿desea borrarlo y volver a descargarlo?[yes:no]" RES
   if [ $RES = "yes" ]; then
      rm -rf $FICHERO
      wget http://$1/$FICHERO
   fi
fi

## En esta parte añadimos dos variables las cuales nos dan los valores que necesitamos, nº de veces que se repite la palabra en el documento y la primera linea en la que aparece dicha palabra. 
NWORDS=$(cat $FICHERO | grep -o $2 | wc -l)
FLINE=$(cat $FICHERO | grep -n $2 | awk -F ":" 'NR==1{print $1}')
##Sentencia if donde haremos la comprobación, si es mayor que 1 haz esto, si es igual a 1 haz lo otro y por último si no es ninguno de estos dos no aparece la palabra en el fichero.
if [[ $NWORDS -gt 1 ]]; then
   echo "La palabra $2 aparece $NWORDS veces"
   echo "La palabra $2 aparece por primera vez en la linea $FLINE"
elif [[ $NWORDS -eq 1 ]]; then
   echo "La palabra $2 aparece $NWORDS veces"
   echo "La palabra $2 aparece por primera vez en la linea $FLINE"
else
   echo "La palabra $2 no aparece en el fichero $FICHERO"
fi