# This is a Awk script.
# Its purpose is to process a FASTA file
# and output the same information as in the input file,
# but in the output, each sequence is on an individual line.


# printing the previous sequence, emptying the buffer and
# printing the current identifier line:
$0 ~/^>/ {
	if (length(buffer) > 0) print buffer;
	buffer = "";
	print
}

# accummulating sequence data in the buffer:
$0 ~ /^[^>]/ { buffer = buffer $0 } 

END { print buffer } # printing out the last sequence
