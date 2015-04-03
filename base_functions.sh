#!/bin/bash
function LOGIT {
	printf "\n\n%-70s%10s\n" "--.$1." "`date +'%H:%M:%S'`--" | tr " " "-" | tr "." " " >> $LOGPATH &&
	printf "%-74s" "$1..."
}
function OKAY {
	printf "\n\n%-70s%10s\n" "--.[OKAY]." "`date +'%H:%M:%S'`--" | tr " " "-" | tr "." " " >> $LOGPATH &&
	echo -e "\e[1;32m[OKAY]\e[0m"
}
function FAIL {
	printf "\n\n%-70s%10s\n" "--.[FAIL]." "`date +'%H:%M:%S'`--" | tr " " "-" | tr "." " " >> $LOGPATH &&
	echo -e "\e[1;32m[FAIL]\e[0m"
}
function TEST {
	LAST_EXITCODE=$?
	if [ $LAST_EXITCODE -eq 0 ]
	then
		OKAY
	else
		FAIL
	fi
	return $LAST_EXITCODE
}
MAKE_DIRECTORY() {
	if [ $1 ]; then
		mkdir -p $1 && echo "keep this file" > $1/.keep
	else
		return 255
	fi
}
