#!/bin/bash
set -e

NWORDS=0
FICHERO=comands.txt
SERVER=172.22.75.224

if [ $# -lt "1" ];then
        echo "Debes introducir un parámetro"
        exit 1
fi

##Una vez comprobamos que el numero de parámetros es correcto, procedemos a confirmar si el fichero existe, de ser así no se hace el wget del server. En mi caso he subido un archivo .txt a un hfs para la prueba.
if ! [ -f "$FICHERO" ]; then
   wget http://$1/$FICHERO
else 
   read -p "El $FICHERO existe, ¿desea borrarlo y volver a descargarlo?[yes:no]" RES
   if [ $RES = "yes" ]; then
      rm -rf $FICHERO
      wget http://$SERVER/$FICHERO
   fi
fi

NWORDS=$(cat comands.txt | grep -o $1 | wc -l)
FLINE=$(cat comands.txt | grep -n $1 | awk -F ":" 'NR==1{print $1}')

if [[ $NWORDS -gt 0 ]]; then
        echo "La palabra $1 aparece $NWORDS veces"
        echo "La palabra $1 aparece por primera vez en la linea $FLINE"
else
        echo "La palabra $1 no aparece en el fichero"
fi