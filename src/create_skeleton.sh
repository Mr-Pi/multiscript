################################################################################
# create a simple skeleton for multiscript
################################################################################

CREATE_SKELETON() {
	EXITCODE=12
	MULTISCRIPT_PATH=${PWD}/${MULTISCRIPT_NAME}
	echo -e -n "create base directory $MULTISCRIPT_PATH" &&
		MAKE_DIRECTORY $MULTISCRIPT_PATH ; TEST
	echo -e -n "change to base directory $MULTISCRIPT_PATH" &&
		cd $MULTISCRIPT_PATH ; TEST
	echo -e -n "create skeleton" &&
		MAKE_DIRECTORY src &&
		MAKE_DIRECTORY inc &&
		touch description.txt ; TEST
}
