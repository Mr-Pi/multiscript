#!/bin/bash

################################################################################
# initial functionality
################################################################################

#base functionality
echo -e -n "\e[0m"
PASSED='\e[32;1m[PASSED]\e[0m'
FAILED='\e[31;1m[FAILED]\e[0m'
TEST() {
	if [ $? -eq 0 ]
	then
		echo -e "    $PASSED"
	else
		echo -e "    $FAILED"
		exit 1
	fi
}

#base variables
VERSION="1.0.0-b1"
SCRIPTNAME=""
SCRIPTPATH=""


################################################################################
# internal functions
################################################################################

#display a help message
DISPLAYHELP() {
	echo -e "\e[0;1;31m*\e[0;1;31m**************************************************************\e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;1;32m multiscript creation script                         $VERSION \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;1;31m--------------------------------------------------------------\e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m multiscript bundles one or more scripts and files into just  \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m one big executable.                                          \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m                                                              \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m                                                              \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;32m USAGE:                                                       \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m     ./multiscript.sh [option]                                \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m                                                              \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;32m OPTIONS:                                                     \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m     --help | -h:         display this help message           \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m     -c | --compile:      compiles a multiscript              \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m     --create SCRIPTNAME |                                    \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m       -cr SCRIPTNAME:    creates a new multiscript skeleton  \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;0;36m                          named SCRIPTNAME                    \e[0;1;31m*\e[0m"
	echo -e "\e[0;1;31m*\e[0;1;31m**************************************************************\e[0;1;31m*\e[0m"
}

#create target directory and skeleton
CREATENEW() {
	SCRIPTNAME=$1
	SCRIPTPATH=$PWD"/"$1
	echo -e -n "create target directory $SCRIPTPATH" &&
		mkdir $SCRIPTPATH ; TEST
	echo -e -n "change to target directory $SCRIPTPATH" &&
		cd $SCRIPTPATH ; TEST
	echo -e -n "create skeleton" &&
		touch description.txt &&
		touch main.sh &&
		mkdir files && echo "keep this file" > files/.keep &&
		mkdir include && echo "keep this file" > include/.keep ; TEST
}

#compile all stuff
COMPILE() {
	echo -e -n "get multiscript name" &&
		SCRIPTNAME=`echo $PWD | sed 's/.*\/\(.*\)$/\1/g'` ; TEST
	echo -e -n "get path of multiscript" &&
		SCRIPTPATH=$PWD ; TEST
	echo -e -n "get working directory" &&
		SCRIPTTMP=`mktemp -d` ; TEST
	echo -e "bundle files directory:" &&
		tar -cvf $SCRIPTTMP"/files.tar" files ; TEST
#	echo -e -n "get size of files bundle" &&
#		FILESBUNDLESIZE=`ls -l $SCRIPTTMP"/files.tar" | sed 's/.* \(.*\) .* .* .* .*/\1/g'` ; TEST
	echo -e -n "write multiscript header into $SCRIPTNAME.bundle.sh" && cat > $SCRIPTNAME".bundle.sh" << EOF
#!/bin/bash

#base functionality
echo -e -n "\e[0m"
ROOT=\$PWD
PASSED='\e[32;1m[PASSED]\e[0m'
FAILED='\e[31;1m[FAILED]\e[0m'
TEST() {
	if [ \$? -eq 0 ]
	then
		echo -e "    \$PASSED"
	else
		echo -e "    \$FAILED"
		exit 1
	fi
}
echo -e -n "get working directory" &&
	SCRIPTTMP=\`mktemp -d\` ; TEST
echo -e -n "exctract all files" &&
	tail -n +29 \$0 > \$SCRIPTTMP"/files.tar" &&
	cd \$SCRIPTTMP &&
	tar -xvf \$SCRIPTTMP"/files.tar" &&
	cd \$ROOT ; TEST
echo -e -n "create target and pu all files into" &&
	mkdir $SCRIPTNAME &&
	mv \$SCRIPTTMP"/files" $SCRIPTNAME ; TEST

	exit 0
EOF
	TEST
	echo -e -n "put bundle of files into $SCRIPTNAME.bundle.sh" &&
		cat $SCRIPTTMP"/files.tar" >> $SCRIPTNAME".bundle.sh" ; TEST
	echo -e -n "make multiscript executable" &&
		chmod 750 $SCRIPTNAME".bundle.sh" ; TEST
}


################################################################################
# main part
################################################################################
case $1 in
	"--compile" | "-c" | "")
		COMPILE ;;
	"--create" | "-cr")
		CREATENEW $2 ;;
	"-h" | "--help" | *)
		DISPLAYHELP ;;
esac

