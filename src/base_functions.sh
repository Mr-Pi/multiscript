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
		exit ${EXITCODE:-1}
	fi
}

MAKE_DIRECTORY() {
	if [ $1 ]; then
		mkdir $1 && echo "keep this file" > $1/.keep
	else
		return 255
	fi
}
