BEGIN { in_origin_section = 0 } # this switch tells whether we have
# reached the "ORIGIN" section

/^VERSION/ { seqname = $2 ; print ">" seqname; next }

/^ORIGIN/ { in_origin_section = 1; next }

NF == 1 && $1 == "//" { in_origin_section = 0; next }

in_origin_section == 1 {
	sequence = "";			# reinitialize the sequence buffer

	for(i=2; i<=NF; i++) {		# for all the fields except the 1st
		sequence = sequence $i; # concatenate
	}

	print sequence			# print out the sequence (one line)
}


