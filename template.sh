#!/bin/bash
source ./base_functions.sh

LOGDIR="/tmp/$0/"
LOGFILE=$(date +"%Y_%m_%d-%H_%M_%S.log")
LOGPATH="$LOGDIR$LOGFILE"

MAKE_DIRECTORY $LOGDIR
