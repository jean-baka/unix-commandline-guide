#!/bin/bash

# testing the alphabetical comparison operator
u=4
v=20
echo "Is 4 less than 20?"

if [ "$u" \< "$v" ] # comparison on strings
then
	echo "yes for the comparison on strings"
else
	echo "no for the comparison on strings"
fi


if [ "$u" -lt "$v" ] # comparison on numeric values
then
	echo "yes for the comparison on numbers"
else
	echo "no for the comparison on numbers"
fi
