#!/bin/bash
set -e

DEFAULT="Introduce una variable!!"
VAR1=${1:-$DEFAULT}
NWORDS=0

if [ $# -lt "2" ];then
        echo "Debes introducir dos parámetros"
        exit 1
fi
##Una vez comprobamos que el numero de parámetros es correcto, procedemos a hacer el wget del server. En mi caso he subido un archivo .txt a un hfs para la prueba.
wget $2
## En esta parte añadimos dos variables las cuales nos dan los valores que necesitamos, nº de veces que se repite la palabra en el documento y la primera linea en la que aparece dicha palabra. 
NWORDS=$(cat comands.txt | grep -o $1 | wc -l)
FLINE=$(cat comands.txt | grep -n $1 | awk -F ":" 'NR==1{print $1}')
##Sentencia if donde haremos la comprobación, si es mayor que 1 haz esto, si es igual a 1 haz lo otro y por último si no es ninguno de estos dos no aparece la palabra en el fichero.
if [[ $NWORDS -gt 1 ]]; then
   echo "La palabra $1 aparece $NWORDS veces"
   echo "La palabra $1 aparece por primera vez en la linea $FLINE"
elif [[ $NWORDS -eq 1 ]]; then
   echo "La palabra $1 aparece $NWORDS"
   echo "La palabra $1 aparece por primera vez en la linea $FLINE"
else
   echo "La palabra $1 no aparece en el fichero"
fi