################################################################################
# display a help message
################################################################################
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
