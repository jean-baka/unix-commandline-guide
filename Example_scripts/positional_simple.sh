#!/bin/bash

# This simple script prints the first two arguments specified
# on the commandline. Since a variable that is not set never
# produces an error in Bash, a positional argument like $1 is
# just expanded into (or "replaced with") an empty string 
# in case no matching argument was given on the commandline.
echo Argument 1 is $1
echo Argument 2 is $2
