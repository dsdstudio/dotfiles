#!/bin/sh

# 2016-09-19 DSDSTUDIO <http://github.com/dsdstudio>
# file encoding converter
# usage: converter.sh <file extension>
#
# example: ./converter.sh *.c 

ICONV=`which iconv`

__ARGS=$@
__EXPR=
for i in $__ARGS
do 
	__EXPR=$__EXPR' '`find . -name $i`
done

for i in $__EXPR
do
	$ICONV -f euc-kr -t utf-8 $i > ${i}_bak
	rm $i
	mv ${i}_bak $i
done
