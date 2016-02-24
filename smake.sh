#!/bin/bash
# usage:
# bash smake.sh n
# bash smake.sh k
#
if [ "$1" == "k" ];
then
    echo kicsi
    cp Makefile.kicsi Makefile
    cp enhu2.foma.kicsi enhu2.foma
fi
if [ "$1" == "n" ];
then
    echo nagy
    cp Makefile.nagy Makefile
    cp enhu2.foma.nagy enhu2.foma
fi
if [ "$1" != "k" ] && [ "$1" != "n" ];
then
   echo bash smake.sh -k or bash smake.sh -n
fi