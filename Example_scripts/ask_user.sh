#!/bin/bash
echo "Please enter a string:"
read input_string
# we have performed our prompt+input using two commands
# but we could have used the -p option to 'read' 
num_chars=${#input_string}
num_words=$( echo "${input_string}" | grep -o '[^ ]*' | grep -c '' )
echo "You have entered \"${input_string}\", which contains ${num_chars} characters and ${num_words} words in total."
