BEGIN { FS = "\t" }
NR == 1 { gsub(/ /, "_") } # gsub modifies ($0 by default) IN PLACE 
{ print } # works on ALL the lines
