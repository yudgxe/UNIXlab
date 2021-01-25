#!/bin/bash

if [ -z $1 ]; then
	echo not found filename in args
	exit 1
else
	if [ -e $1 ]; then 
	
		FILENAME=`grep output $1`
		
		if [ $? -eq 0 ]; then 
		
			FILENAME=${FILENAME#*//output}
			
			if [ -z $FILENAME ]; then 
				echo invalid output in source file
				exit 1
			else
				TMPFOLDER=`mktemp -d`
				CURRENTFOLDER=$(pwd)
				
				trap "rm -Rf $TMPFOLDER; exit 1" SIGINT SIGHUP SIGTERM
				
				cp $1 $TMPFOLDER/
				cd $TMPFOLDER
				
				gcc $1 -o $FILENAME
				
				if [ $? -eq 0 ]; then 
					mv $FILENAME "$CURRENTFOLDER"
					cd "$CURRENTFOLDER"
					rm -Rf $TMPFOLDER
					echo $FILENAME - build file name
				else
					echo compilation error
					cd "CURRENTFOLDER"
					rm -Rf $TMPFOLDER
					exit 1
				fi
			fi
		else 
			echo write outout in source file
			exit 1
		fi
	else
		echo file $1 not exist
		exit 1
	fi
fi
