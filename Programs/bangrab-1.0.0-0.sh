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

echo -n "Enter target host: "
read HOST
echo -e "Grabbing banner...\n"

function netcatinput {
	echo "OPTIONS / HTTP/1.1"
	echo -e "HOST: 127.0.0.1\n\n"
}

netcatinput | netcat -q 2 $HOST 80 | cat | grep -E 'Server:|Powered-By:'

echo ""
