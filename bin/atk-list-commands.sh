#!/usr/bin/env bash
#INFO: lists out all the scripts installed and their information

[ -z "$ATK_HOME" ] && { 
    echo "ATK not properly setup. Exiting."; exit 1
    }

source $ATK_HOME/bin/atk-funcs.sh

e_header "Installed programs"

extract_info() {
    pgm=$1
    grep "^#INFO:" $1 | sed -e "s/#INFO://g"
}

for i in ${ATK_HOME}/bin/atk-*.sh
do
    info=$(extract_info $i)
    pgmname=$(basename $i)
    e_success "$pgmname:" "${info}"
done

