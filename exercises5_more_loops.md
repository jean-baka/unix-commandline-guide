## Extracting the branch lengths from a phylogenetic tree

Phylogenetic trees are most commonly stored into a Newick/New Hampshire file. Such files are raw text files where information is encoded in a parenthesized form (see [this rather old page by Joe Felsenstein](https://evolution.genetics.washington.edu/phylip/newicktree.html) or [this Wikipedia page about the file format](https://en.wikipedia.org/wiki/Newick_format)). The NHX format stands for "New Hampshire eXtended", and adds the possibility to use tags of different types within square brackets.

In a Newick or NHX tree file, branch lengths (when they exist) immediately follow a colon (`:`) character. They can be written either in usual floating point decimal notation (e.g. `0.077429`), or in scientific notation (e.g. `1e-06`).

  1. In the file `phyldog.nhx`, grep all the branch lengths. How many branches are there?

  2. Get the range of the branch lengths: what is the minimum branch length and the maximum branch length? Write a small program that outputs those two values, and that would work as well on huge trees with thousands of taxa.

  3. In phylogenetics, the **tree length** is the sum of all the branch lengths in that tree. While pure, "basic" Bash only handles integer arithmetics through e.g. the `expr` command, it is possible to do non-integer arithmetics via the use of the `bc` utility (which stands for "**b**asic **c**alculator"). Just pass the expression to calculate to the standard input of `bc -l`, like so:

> $ echo "(0.003 + 0.456) * (-37)" | bc -l

> -16.983

Calculate the tree length for the tree in `phyldog.nhx`. As `bc` doesn't understand the scientific notation, we can leave the (small) branch lengths written in scientific notation for now, under we see ways to a more satisfactory solution.


## GC content from a Fasta file

The GC content for one or a set of sequence(s) is usually expressed as a percentage, corresponding to the ratio of guanine and cytosine characters over the total number of characters in a sequence.

  4. Write a  script that takes as input a (nucleotide) Fasta file given as the first and only commandline argument for the script, and outputs its overall GC content. You can use the `nrf1_seq.fa` file to test this. Here, "overall" means that your script will return only one GC-content value for all the input file.

  5. Modify your script so that it yields one GC content value per sequence, and so that, after reporting the individual GC contents, it tells the user, through two additional sentences, which sequence is the more GC-rich, and which sequence the most AT-rich. In this report, sequences will be identified by the part of their identifier line preceding the first space on that line. In `nrf1_seq.fa`, these are accession numbers.
