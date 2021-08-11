# this script takes as input an EMBL file
# and outputs in a single nucleotide Fasta file all the genes
# present as annotations in the EMBL file.
# In this version, we truncate the lines to LLEN characters,
# where LLEN is a variable set in the BEGIN rule.
#
# We use awk arrays where the key is a gene name to store:
# - beginning position
# - end position
# - whether the gene is to be read in the opposite (complement) strand
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


function extract_sequence(long_string, begin_pos, end_pos, revcomp) {
	#DEBUG
	#print "begin_pos: " begin_pos "\n";
	#print "end_pos: " end_pos "\n";

	# extracts a substring, revcomp'ing it if indicated by the last argument
	if (revcomp) {
		final_string = ""; orig_string = substr(long_string, begin_pos, end_pos - begin_pos + 1); l = length(orig_string);
		# in the following loop we implement the string mirroring and the nucleotide complement
	       	for (i=0; i<l; i++) final_string = final_string comp_letter(substr(orig_string, l-i, 1)); # concatenation
		return final_string
	} else return substr(long_string, begin_pos, end_pos - begin_pos + 1);
}

function comp_letter(nucl) {
	# takes a letter as input and returns its complement
	switch(nucl) {
		case "a":
			return "t"
		case "c":
			return "g"
		case "g":
			return "c"
		case "t":
			return "a"
		case "w": # weak
			return "s"
		case "s": # strong
			return "w"
		case "r": # purine
			return "y"
		case "y": # pyrimidine
			return "r"
		case "k": # keto
			return "m"
		case "m": # amino
			return "k"
		case "b": # anything but a
			return "v"
		case "d": # anything but c
			return "h"
		case "h": # anything but g
			return "d"
		case "v": # anything but t
			return "b"
		default:
			return "n"
	}
}



BEGIN { reading_orig_seq = 0;	# flag to say when we are busy reading the whole original nucleotide sequence
	fullseq = ""; 		# this string variable will hold the full sequence. I don't know of any
       				# size limit for strings in awk...	
	LLEN = 60 }

$1 == "SQ" { reading_orig_seq = 1; next } # the SQ tag appears before the first line of the original sequence

reading_orig_seq && /^\/\/$/ {
	# the double forward slash triggers the output, since we are done reading the sequence
	for (gene in start) { # going through an array, gene is the key
		printf(">%s\n", gene); # the identifier line
		nucleotide_seq = extract_sequence(fullseq, start[gene], end[gene], opposite_strand[gene]);
		print_string_in_chunks(nucleotide_seq, LLEN);
	}
}

reading_orig_seq { # and not having the double slash
	# we read all fields but the last one (which is an index) and concatenate them into the fullseq variable
	for (i=1; i<NF; i++) fullseq = fullseq tolower($i) # string concatenation, making sure we only use lowercase nucleotides
}

$1 != "FT" { next } # ignore those lines that don't belong to any feature
# in all the rules below this point, we know $1 is "FT"

$2 == "gene" {
	# here, $3 is the position information: either some "complement(...)", or a direct "xxx..yyy"
	#
	complement = 0; # resetting
	if (substr($3, 1, 10) == "complement") {
		complement = 1;
		$3 = substr($3, 12, length($3)-12) # getting rid of the leading "complement(" and of the trailing ")"
	}
	split($3, position, /\.\./); # the specification of the field splitter is a regexp, hence the escape characters
	#DEBUG
	#print "position[1]: " position[1] "\n";
	#print "position[2]: " position[2] "\n";

	## WARNING in the following, perhaps we have to make sure the variable will be interpreted as numeric, and not strings
	if (position[1] < position[2]) { gene_begins = position[1]; gene_ends = position[2]; }
	else { gene_begins = position[2]; gene_ends = position[1]; } # this ensures the start position is always smaller than the end oposition
	next
} 

$2 ~ /\/gene=/ {
	split($2, arr, "\""); gene = arr[2];	# we have the gene name, now storing the info...
	opposite_strand[gene] = complement;	# 0 i fon reference strand, 1 if on opposite strand
	start[gene] = gene_begins;
	end[gene] = gene_ends;
	next
}

