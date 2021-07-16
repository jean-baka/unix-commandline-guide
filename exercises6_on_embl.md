# Working with EMBL annotation files

In this set of exercises, we will work on EMBL files. Those contain annotations, and you have [one example of such a file](https://github.com/jean-baka/unix-commandline-guide/blob/main/Sample_datafiles/MN393476.embl) in the folder called "Sample\_datafiles".

These exercises can be tackled either with Unix commandline tools (the basic shell utilities called from a Bash script, ore more advanced stream editors like sed and awk) as well as with Python.


## Basic statistics (gff-like) on the annotations

The goal of this exercise is to produce a tab-separated file in which each line gives information on an annotation present in [this input file](https://github.com/jean-baka/unix-commandline-guide/blob/main/Sample_datafiles/MN393476.embl). This case is a simplified one compared to the most generic case of annotation files in the EMBL format, since this example is from a virus and does not contain gene models with introns. The fields in the output file shall be as follows:

  1. name of the gene (e.g. "MGF\_110-1L", "L11L" or "I243L")

  2. position\_start (an integer giving the genomic position of the first nucleotide in the said gene)

  3. position\_stop (an integer that must always be larger than position\_start)

  4. strand ("+" in case the gene is coded in the direct strand, "-" in case it is on the other strand)

  5. total nucleotide length for this gene (equal to position\_stop - position\_start + 1)


Moreover, since this embl file pertains to some African swine fever strain, many gene names contain in their final letter the indication on which strand they are on: "R" stands for the **r**ight direction, i.e. the reference strain, while "L" stands for the **l**eft direction, i.e. the complement strain.

Your script must send to the standard error stream a warning message each time the final letter of a gene name is not in accordance with the fact that "R" genes must not have a "complement(...)" position information, while "L" genes must have such a position information.

When a gene name does not end with an uppercase letter (e.g. in the case of "ASFV\_G\_ACD\_01990"), no check must be performed about this.



## Sorting a gff-like file

In a separate program or commandline, work on sorting the output of the previous script in two different orderings:

  1. Sort strictly per position in the reference sequence: sort on increasing start positions of the gene, breaking the ties, if they exist, using the increasing order of end positions.

  2. Sort per decreasing size of the gene length, so that we get at the top of the file the largest genes.



## Producing a Fasta file with all the translations

From the same input embl file, produce a (multi-)Fasta file containing all the translations, as amino-acid sequences. The identifiers will be the protein IDs, but the rest of the identifier line will contain "from gene xxx", as so:

> >QIE06932.1 from gene I196L
> MLFRYLVWLFRFIEVKNVVSISLLVIGSNYLTTAISNNTSTTISP
> TTTSSNYLMTAISNNTSTTISPTTTSSNYLMTAIPNIISDKEDDIHFSTDKTVFDRLSP
> ITLYRAIRSTLNDTSTKTMTDHILTRPYRPTTVIFHSDTPQPVKNATQGNIVKKIYRQV
> LTFFIQPNPLFPCFKNHEVFLNLANILNTILCIILIKNV

Even better if you can beautify the output a bit by having all lines but the last one being of the same length, for instance 60 or 80 characters.


## Producing a Fasta file with all the gene nucleotide sequences

Here, you will use the position information together with the full sequence that is present at the end of the file (section introduced by the "SQ" tag) in order to produce a Fasta file containing all the gene nucleotide sequences.

When a gene is encoded on the complement strand, you will have to write out the correct reverse-complement sequence, not just an excerpt of the reference sequence itself. Basically, in the end, all your output sequences are expected to start with "ATG".

This exercise *is difficult*. In case you are using Awk or Bash, you will have to learn a bit more how to handle arrays in these programming environments, because you will have to store an arbitrary number of things in memory before re-using the same. That is typically done through arrays or tables.
