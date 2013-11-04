#!/bin/sh

################################################################################
# VARIABLES
################################################################################
IFS=
VERSION="1.0.0-b1"
COMMAND_LINE_OPTIONS=$*

################################################################################
# include other scripts
################################################################################
source ./base_functions.sh
source ./create_skeleton.sh
source ./help.sh

################################################################################
# main part
################################################################################
case $1 in
	"--compile" | "-c" | "")
		echo compile ;;
#		COMPILE ;;
	"--create" | "-cr")
		if [ $2 ]; then
			MULTISCRIPT_NAME=$2
		else
			read -p "multiscript name: " MULTISCRIPT_NAME
		fi
		CREATE_SKELETON ;;
	"-h" | "--help" | *)
		DISPLAYHELP ;;
esac

