# this script takes as input an EMBL file
# and outputs in a single Fasta file all the protein models that are
# present as annotations in the EMBL file.
# In this version, we truncate the lines to LLEN characters,
# where LLEN is a variable set in the BEGIN rule
#
function print_string_in_chunks(string_to_print, chunk_length) {
	# this user-defined function prints a string into several
	# chunks separated by newlines
	string_length = length(string_to_print);
	chunk_begin = 1; # position where we start to print
	while (chunk_begin <= string_length) {
		print substr(string_to_print, chunk_begin, chunk_length);
		chunk_begin = chunk_begin + chunk_length
	}
}

BEGIN { continue_translation = 0; # flag to say when we are busy reading a (potentially multi-line) translation
	LLEN = 60 }

$1 == "SQ" { exit } # the SQ tag appears once all the translations are read, hence we exit

$1 != "FT" { next } # ignore those lines that don't belong to any feature

# in all the rules below this point, we know $1 is "FT"

$2 ~ /\/gene=/ { split($2, arr, "\""); gene = arr[2]; next } # the gene name appears between the first and second double-quote characters, and we use the split() function to cut the string into substrings, using quotes as separators

$2 ~ /\/protein_id=/ { split($2, arr, "\""); prot = arr[2]; next } # the protein identifier appears between the first and second double-quote characters

$2 ~ /\/translation=/ {
	num_fields = split($2, arr, "\"");
	# we now print:
	printf(">%s from gene %s\n", prot, gene); # header line
	translation = arr[2]; # the beginning of the translation, erases what was in that variable before.
	# in order to know whether the translation was fitting on one line or not,
	# we must test the last character in $2:
	last_char = substr($2, length($2));
	if (last_char != "\"") continue_translation = 1; else { continue_translation = 0; print_string_in_chunks(translation, LLEN) }
	next
} 

continue_translation {
	# we test the last character in $2:
	if (substr($2, length($2)) == "\"") {
		# then we have finished the translation
		if (length($2) > 1) translation = translation substr($2, 1, length($2)-1); # concatenation
		continue_translation = 0;
		print_string_in_chunks(translation, LLEN)
	} else {
		# we still need to read more of the translation
		translation = translation $2 # concatenation, and continue_translation is still set to 1
	}
}
