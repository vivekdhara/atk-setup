#!/bin/bash
#INFO: Changes markdown into standalone HTML file. No external dependencies.
usage() {
cat <<_EOF_
Usage: ${0} -h -v -c <cssfile>
_EOF_
}

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source ${DIR}/atk-funcs.sh


ATK_HOME=${ATK_HOME-$HOME/.atk}
OPTIND=1
verbose=0
CSSFILE=${ATK_HOME}/etc/pandoc.css

while getopts "h?vc:" opt
do 
    case "$opt" in 
        h|\?)
            usage
            exit 0
            ;;
        v) verbose=1
           echo "Verbose on"
            ;;
        c) CSSFILE=$OPTARG
           echo "Using $OPTARG as the css"
           shift;
            ;;
        *) 
            echo "Unknown option"
	        usage
            exit 0
            ;;
    esac
done

shift $((OPTIND-1))

if [ -z "$1" ]
then
    echo "No arguments supplied."
    exit 1
fi

for i in $*
do
    echo "converting $i to html"
    pandoc -s --self-contained --css $CSSFILE --to html5 --from markdown "$i" -o $(basename "$i" .md).html
    shift
done
