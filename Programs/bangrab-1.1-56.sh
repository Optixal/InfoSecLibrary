#!/bin/bash

VERSION=1.0.0

clear
cat << "EOF"
 ____ ___  ___ _ _ _ ____ _                                        
 [__] |--'  |  | _X_ |--| |___                                     
 ___  ____ __ _ __ _ ____ ____   ____ ____ ____ ___  ___  ____ ____
 |==] |--| | \| | \| |=== |--<   |__, |--< |--| |==] |==] |=== |--<

EOF

echo -e "HTTP Web Server Banner Grabber\nVersion $VERSION | 28 May, 2016\n"

function netcatinput {
	echo "OPTIONS / HTTP/1.1"
	echo -e "HOST: 127.0.0.1\n\n"
}

function color {
	GREEN="\033[0;32m"
	CYAN="\033[0;36m"
	GRAY="\033[0;37m"
	BLUE="\033[0;34m"
	YELLOW="\033[0;33m"
	REDBOLD="\033[1;91m"
	NORMAL="\033[m"
	color=\$${1:-NORMAL}
	echo -ne "`eval echo ${color}`"
	cat
	echo -ne "${NORMAL}"
}

while true
do
	echo -e "[1]\t-\tSimple Banner Grab"
	echo -e "[2]\t-\tFull Banner Grab"
	echo -e "[Q]\t-\tExit\n"
	echo -e "Press a key to continue\n"
	read -rsn1 key
	case $key in
		1)
			echo "[Simple Banner Grab]"
			echo -n "Enter target host: "
			read HOST
			echo -e "Grabbing banner...\n"
			
			netcatinput | netcat -q 2 $HOST 80 | cat | grep -E 'Server:|Powered-By:' | color REDBOLD
			
			echo ""
			;;
		2)
			echo "[Full Banner Grab]"
			echo -n "Enter target host: "
			read HOST
			echo -e "\nGrabbing banner...\n"
			
			netcatinput | netcat -q 2 $HOST 80 | cat | color CYAN
			
			echo ""
			;;
		q)	
			exit;;
	esac
done


