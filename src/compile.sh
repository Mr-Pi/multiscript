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
