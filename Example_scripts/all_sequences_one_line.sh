#!/bin/bash

# testing that we have exactly one commandline argument
if [ $# -ne 1 ]
then
	echo "Usage: $0 <fasta_file>" >/dev/stderr
	exit 14
fi

if [ ! -e $1 ]
then
	echo "Unable to find the file $1" >/dev/stderr
	exit 13
fi


# The following is a while loop fed from a file,
# meaning it receives the contents of the file as its standard input.
# The said file is the one given as the first commandline argument.
while read myline 
do
   echo "line: ${myline}" 
done                       < $1   


exit




for i in $( seq $# )
do
  curr_arg=$( eval echo \$$i )
  # the escape character in the above is necessary in order to
  # prevent the expansion by bash of "$$" (which yields the current PID)
  echo "The argument #$i is: ${curr_arg}"
done

