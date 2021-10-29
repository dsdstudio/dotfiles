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
	UPDATE_FILE_LIST=`ls ~/temp/v0.20/*.sql`
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
	echo "usage ./sql-merge.sh PLMS20."
	echo "usage ./sql-merge.sh replace_schema_name"
	exit -1
fi

detect_os
update_version $1 $2
