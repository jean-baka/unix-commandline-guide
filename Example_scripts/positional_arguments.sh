#!/bin/bash

# introducing positional arguments
echo "The command launched is $0"
echo "This program was started with $# commandline args."

echo '$*'" expands to \"$*\""



for i in $( seq $# )
do
  curr_arg=$( eval echo \$$i )
  # the escape character in the above is necessary in order to
  # prevent the expansion by bash of "$$" (which yields the current PID)
  echo "The argument #$i is: ${curr_arg}"
done

