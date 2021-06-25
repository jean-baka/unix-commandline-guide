BEGIN { FS = "\t" }
NR == 2 { exit }
{ for (i=1; i<=NF; i++) print $i } # printing all fiels from the 1st record

