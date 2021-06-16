UNIX commandline exercises on a Fasta file
================

This is a simple set of exercises designed to help bioinformatics learners gain confidence in dealing with the command line in UNIX environments. Simple UNIX command line tools are used.

The FASTA format
----------------

The FASTA format is the simplest format for biological sequences (DNA, RNA or proteins). A file in FASTA format is a simple text file containing sequences and lines identifying them: every sequence in FASTA format begins with a single-line description, followed by an arbitrary number of lines of sequence data, in which each character in the file corresponds to a biological character (nucleotide or amino acid). It is recommended that all lines of text be shorter than 80 characters in length, including identifier lines, but you cannot rule out situations in which some lines may be longer.

Identifier lines start with the "greater than" character (&gt;). There should be no space before that character. The remaining of such a line identifies the following lines.

Between two identifier lines there should be at least one line with biological data (sequence of characters). It is an error leading to undetermined behavious to have two consecutive lines starting with a "&gt;".

Empty lines in a FASTA file do not matter and, when present, it is only for the purpose of readability. Biological sequence data is encoded following the international standard called [the IUPAC alphabet](http://www.bioinformatics.org/sms2/iupac.html).

Exercises
---------

Given the given FASTA file `my_sequences.fa` from this folder, you must answer the following questions using the commandline only (although you are welcome to check you answers by any usable means), and provide the trainer with the commands you used:

0.  First things first, downlod the **raw** file `my_sequences.fa` from this GitHub repository using `wget` or `curl`, as we have already done with the previous Fasta file.

1.  count the number of sequences (hint: `wc`)

2.  extract all identifiers and store them in a separate file (hint: `grep`)

3.  the sequences come from the UniProtKB-SwissProt database. All identifiers follow the same format: `db|UniqueIdentifier|EntryName`, followed by a space and an additional, longer description. Extract the unique identifiers for all the sequences. Store them in a file called `short_identifiers` and check that they are indeed unique (hint: `sort`, `uniq`)

4.  extract the raw sequences in a file named `raw_sequences`, without any identifying information and no blank lines. This is somehow the complementary of the "extract all identifiers" question. Try and get a count for all the different characters in the data. Hint 1: you will have to get each single character on its own line. See the `-o` option for `grep`. Hint 2: explore the manpage of the `uniq` command.

5.  see the `OS=` tag in each identifier line? It is always followed by the scientific name of the origin species (in two words, separated by a single space). Process these to get the number of different species present in the dataset (Hint: you will have to write a simple regular expression and use grep to parse these).

6.  try and build a file with 2\*n lines, where n is the number of sequences: in the file we want, each sequence is on its own line, breaking the "no more than 80 characters per line" soft rule. Save this file as `seqs_one_line.fa` (HARD)

7.  calculate the length of each sequence. Do all sequences have the same length? (HARD)
