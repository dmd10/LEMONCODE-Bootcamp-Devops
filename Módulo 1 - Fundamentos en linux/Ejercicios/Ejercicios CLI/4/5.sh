#!/bin/bash
set -e

DEFAULT="Me encanta bash!!"
VAR1=${1:-$DEFAULT}
NWORDS=0

wget http://172.27.15.18/comands.txt

NWORDS=$(cat comands.txt | grep -o $1 | wc -l)
FLINE=$(cat comands.txt | grep -n $1 | awk -F ":" 'NR==1{print $1}')

if [[ $NWORDS -gt 0 ]]; then
        echo "La palabra $1 aparece $NWORDS veces"
        echo "La palabra $1 aparece por primera vez en la linea $FLINE"
else
        echo "La paralabra $1 no aparece en el fichero"
fi








