## More commandline exercises: simple commands, redirection, pipes, etc

In most cases, the questions below are independent of each other. Many questions accept different ways to address them (which means several "right answers"). Some of these questions are a bit advanced and require tools you will see only in the next session, so please don't worry if you can't answer some of them. But you can also **learn new commands** by using the hints given and browse the corresponding manpages: `man` is your one ever-faithful, reliable friend in the Unix world.


  1. How can you use the commandline (on whichever machine you are now, that is connected to the internet) to download directly the file at `https://github.com/eanbit-rt/IntroductoryLinux-2019/blob/master/Data/nrf1_seq.fa`? See `wget` or `curl` and their manpages. Be careful, you need to get the raw text file itself, not the full HTML page presenting it.

  2. Change the rights of the file so that you can only read from it and no-one else can do anything with it.

  3. How can you count the number of lines in this text file? How do you count the number of sequences?

  4. Extract only the identifier lines from this file, and write them into a file called `identifiers.txt`.

  5. How to write a Bash commandline producing all the integers from 1 to 30, one per line?

  6. Create a file called `trial1` and rename it into `trial1.data`.

  7. Create at once 20 files called `trial1` to `trial20` and *then* rename them all by appending the suffix `.data` to their filenames. Of course, don't issue 20 commands, but just one. (Hint: string variable manipulations and loops)

  8. How can you separately redirect the standard output and the standard error streams into two separate files?

  9. How can you process the file you got from question 10 to replace all its uppercase "A" letters into lowercase "a" letters, leaving the rest untouched? (Hint: `tr`)

  10. In one command, ask for the display of all identifier lines from the same file `nrf1_seq.fa` without wrapping the lines, i.e. by having all lines displayed on your screen effectively start with the character ̀>`. (Hint: `less`)

  11. Can you write a very short script (possibly one single commandline) to extract from the same file the species names? (Hint: `cut`, `grep`)

  12. Once this is done, how to count the species names with their order of multiplicity (i.e. how many sequences belong to *Mus musculus*, how many to *Homo sapiens*, etc)? (Hint: `uniq`)
