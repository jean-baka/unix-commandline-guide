Mimicking the Unix utility `wc` with a script
======================

The idea for this exercise came from Sana Adam who said on Thursday "Sir, we could ask for the user input!" ;-)

We are going to emulate the behaviour of the `wc` command with a Bash script. The input will be the user input.

How to get the user input into a variable
--------

In Bash, we use the built-in utility `read` in order to read a line from the user input on the keyboard: the command `read b` gets the input from the standard input stream (usually fed from the keyboard) and stores into the variable `b` whatever you type until you press `Enter` (of course, *you* choose the name of the variable to write into).


The exercise
-------

1. Write a small shell program that asks for the user input, and then reports in a user-friendly way a message telling the number of words and the number of characters in the input, e.g. "The input contained xx words, yy characters in total."

2. Add the line `#!/bin/bash` as the first line of your script, change its name to `wc` and change its permissions so that you can execute it.

3. Run you program. What happens when you type `wc`? And what when you type `./wc`? 
