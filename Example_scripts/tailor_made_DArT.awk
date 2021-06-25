BEGIN { FS = OFS = "\t" } # double assignment: FS is equal to OFS and to "\t"
NR == 1 { gsub(/ /, "_"); print; next } # preserves the header line

# the following line replaces in all lines containing the word "chromosome"
# the longest string matching the regexp /.* / (i.e. everything until and
# including the last space) with an empty string.
# This replacement is performed on the third field only.
/chromosome/ { sub(/.* /, "", $3); print }

