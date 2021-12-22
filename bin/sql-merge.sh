#!/usr/bin/env bash
# sql schema clearer script
OS=""
detect_os() {
        case `uname` in
                Linux) OS="linux" ;;
                Darwin) OS="osx" ;;
                *) OS="unknown" ;;
        esac
}
detect_os

function merge_sql() {
	UPDATE_FILE_LIST=`ls ~/temp/*.sql`
	OUTPUT=output.sql
	for i in $UPDATE_FILE_LIST
	do
			case $OS in
					osx) sed -i '' "s/${1}//" $i;;
					*) sed -i "s/${1}//" $i;;
			esac
			cat $i >> $OUTPUT
	done
}

if [ $# -ne 1 ]
then 
	echo "usage ./sql-merge.sh <filepath_pattern> <schemaname>"
	echo "usage ./sql-merge.sh ~/temp/*.sql PLMS20."
	exit -1
fi

detect_os
merge_sql $1 
