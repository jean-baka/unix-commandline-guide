# This is a Awk script.
# Its purpose is to process a FASTA file
# and output the same information as in the input file,
# but in the output, each sequence is on an individual line.

BEGIN { buffer = "" } # the "buffer" variable will hold sequence data
# and will grow as we read consecutive lines of sequence data pertaining
# to the same sequence identifier.


# printing the previous sequence, emptying the buffer and
# printing the current identifier line:
/^>/ {
	# The condition to the if MUST be surrounded by parentheses.
	# When transformed to boolean values, empty strings translate
	# into FALSE
	if (buffer) {  # an "if" with no "else": if buffer is not empty
		print buffer; # printing the one-line sequence data to std output
		print "Sequence " seqname " has " length(buffer) " characters." > "/dev/stderr"
	}

	buffer = "";
	print;

	# saving the new sequence name for future use
	seqname = substr($1,2);

	next # stop any further processing of the current line
	# and go consume the next record from the input
	# and restart scanning all selection rules from the first.
}


# accummulating sequence data in the buffer:
{ buffer = buffer $0 }
# because of the "next" command above,
# this will be done only for the lines not
# matchin the first rule

END {
	print buffer;
	print "Sequence " seqname " has " length(buffer) " characters." > "/dev/stderr"
} # printing out the last sequence (to stdout) and its length (to stderr)
